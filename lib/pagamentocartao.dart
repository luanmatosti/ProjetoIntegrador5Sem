import 'package:flutter/material.dart';


class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}


class _PagamentoState extends State<Pagamento> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  bool _isCardNumberValid = false;
  bool _isExpirationDateValid = false;
  bool _isCvvValid = false;
  bool _isCardHolderNameValid = false;


  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationDateController.dispose();
    _cvvController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }


  void _validateCardNumber(String value) {
    setState(() {
      _isCardNumberValid = value.length == 16;
    });
  }


  void _validateExpirationDate(String value) {
    setState(() {
      _isExpirationDateValid = value.length == 5;
    });
  }


  void _validateCvv(String value) {
    setState(() {
      _isCvvValid = value.length == 3;
    });
  }


  void _validateCardHolderName(String value) {
    setState(() {
      _isCardHolderNameValid = value.isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagamento'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Número do Cartão:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Digite o número do cartão',
                          errorText:
                              _isCardNumberValid ? null : 'Número de cartão inválido',
                        ),
                        onChanged: _validateCardNumber,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Validade:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        controller: _expirationDateController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Digite a validade (MM/YY)',
                          errorText: _isExpirationDateValid
                              ? null
                              : 'Formato de validade inválido',
                        ),
                        onChanged: _validateExpirationDate,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'CVV:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        controller: _cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Digite o  CVV',
                          errorText: _isCvvValid ? null : 'CVV inválido',
                        ),
                        onChanged: _validateCvv,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Nome Completo Cartão:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      TextField(
                        controller: _cardHolderNameController,
                        decoration: InputDecoration(
                          hintText: 'Digite o nome conforme cartão',
                          errorText: _isCardHolderNameValid
                              ? null
                              : 'Nome não pode estar vazio',
                        ),
                        onChanged: _validateCardHolderName,
                      ),
                      SizedBox(height: 16.0),


                      /*RaisedButton(
                child: Text('Pay'),
                onPressed: _isCardNumberValid &&
                        _isExpirationDateValid &&
                        _isCvv
  */
                    ]))));
  }
}
