import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class ApiService {
  Future modifyQuantity(int id, int newQuantity) async {
    final url = Uri.parse('http://localhost:3000/cart/$id');

    final response = await http.patch(
      url,
      body: jsonEncode({'quantity': newQuantity}),
      headers: {'Content-Type': 'application/json'},
    );
    print(id.toString() + " " + newQuantity.toString());

    if (response.statusCode == 200) {
      // Atualização bem-sucedida
      print('Produto atualizado com sucesso');
    } else {
      // Lidar com erros de resposta
      print(
          'Falha ao atualizar o produto. Código de status: ${response.statusCode}');
    }
  }

  Future addProduct(String title, double price) async {
    final url = Uri.parse('http://localhost:3000/cart');
    final result = await http.post(
      url,
      body: jsonEncode({'title': title, 'price': price, 'quantity': 1}),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future cleanCart(id) async {
    final url = Uri.parse('http://localhost:3000/cart/$id');

    final response = await http.delete(url);
    if (response.statusCode == 200) {
      // Exclusão bem-sucedida
      print('Carrinho limpo');
    }
  }

  Future getCart() async {
    final allProductsUrl = Uri.parse('http://localhost:3000/cart/');
    final result = await http.get(allProductsUrl);
    return json.decode(result.body);
  }

  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final result = await http
        .post(loginUrl, body: {'username': username, 'password': password});

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }

  Future getAllProducts() async {
    final allProductsUrl = Uri.parse('https://fakestoreapi.com/products');
    final result = await http.get(allProductsUrl);

    return json.decode(result.body);
  }

  Future userRegister(User user) async {
    final userUrl = Uri.parse('https://fakestoreapi.com/users');
    final result = await http.post(userUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': user.email,
          'username': user.nickname,
          'password': user.password,
          'name': {'firstname': user.firstname, 'lastname': user.lastname},
          'address': {
            'city': user.city,
            'street': user.street,
            'number': 1,
            'zipcode': user.zipcode,
            'geolocation': {'lat': user.lat, 'long': user.long}
          },
          'phone': user.phone
        }));

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }

  Future getSingleProduct(int id) async {
    final singleProd = Uri.parse('https://fakestoreapi.com/products/$id');
    final result = await http.get(singleProd);

    return json.decode(result.body);
  }

  Future getSingleCart(int id) async {
    final singleCart = Uri.parse('http://localhost:3000/cart/3');
    final result = await http.get(singleCart);
    return json.decode(result.body);
  }

  Future getBuy() async {
    final buy = Uri.parse('http://localhost:3000/finalizar');
    final result = await http.get(buy);
    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }

  Future finishBuy(FinalizarCompra buy) async {
    final userUrl = Uri.parse('http://localhost:3000/finalizar');
    Random random = Random();
    int randomNumber = random.nextInt(9000) + 1000;
    final result = await http.post(userUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "idCompra": randomNumber,
          "itens": [
            {
              "idProduto": "P001",
              "nome": "Produto 1",
              "quantidade": 2,
              "precoUnitario": 9.99
            },
            {
              "idProduto": "P002",
              "nome": "Produto 2",
              "quantidade": 1,
              "precoUnitario": 14.99
            }
          ],
          "total": buy.total,
          "enderecoEntrega": {
            "rua": buy.enderecoEntrega.rua,
            "numero": buy.enderecoEntrega.numero,
            "referenca": buy.enderecoEntrega.referencia,
            "cep": buy.enderecoEntrega.cep
          },
          "informacoesPagamento": {
            "numeroCartao": buy.informacoesPagamento.numeroCartao,
            "dataValidade": buy.informacoesPagamento.dataValidade,
            "codigoSeguranca": buy.informacoesPagamento.codigoSeguranca,
            "Nome": buy.informacoesPagamento.nome
          }
        }));

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }
}

//classe para usuario
class User {
  final String nickname;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final String phone;
  final String lat;
  final String long;

  User(
      this.nickname,
      this.email,
      this.password,
      this.firstname,
      this.lastname,
      this.city,
      this.street,
      this.number,
      this.zipcode,
      this.phone,
      this.lat,
      this.long);

  @override
  String toString() {
    return 'User{nick: $nickname ,email: $email ,senha: $password ,pnome: $firstname ' +
        ', lnome: $lastname ,cidade: $city, rua: $street, numero: $number, zip: ' +
        '$zipcode, cell: $phone , lat: $lat, long: $long}';
  }
}

//classe para finalizar compra
class FinalizarCompra {
  //List<ItemCompra> itens;
  double total;
  Endereco enderecoEntrega;
  InformacoesPagamento informacoesPagamento;

  FinalizarCompra(
    // this.itens,
    this.total,
    this.enderecoEntrega,
    this.informacoesPagamento,
  );

  @override
  String toString() {
    return 'FinalizarCompra{ itens: itens, total: $total, enderecoEntrega: $enderecoEntrega, informacoesPagamento: $informacoesPagamento}';
  }
}

class ItemCompra {
  String idProduto;
  String nome;
  int quantidade;
  double precoUnitario;

  ItemCompra(
    this.idProduto,
    this.nome,
    this.quantidade,
    this.precoUnitario,
  );
}

class Endereco {
  String rua;
  String numero;
  String referencia;
  String cep;

  Endereco(
    this.rua,
    this.numero,
    this.referencia,
    this.cep,
  );
}

class InformacoesPagamento {
  String numeroCartao;
  String dataValidade;
  String codigoSeguranca;
  String nome;

  InformacoesPagamento(
    this.numeroCartao,
    this.dataValidade,
    this.codigoSeguranca,
    this.nome,
  );
}
