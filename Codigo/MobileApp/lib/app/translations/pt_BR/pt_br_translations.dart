final _headers = {
  'delivery_code_form_header':
      'Você possui um código para realizar uma entrega?',
  'phone_form_deliverer_header':
      'Antes de acessar a rota de entrega, insira seu número de WhatsApp',
  'phone_form_supplier_header':
      'Parceiro, acesse sua conta com seu número de WhatsApp',
};

final _subHeaders = {
  'delivery_code_form_sub_header':
      'Caso não, mas deseje ver suas entregas pendentes, acesse sua conta de parceiro Trela',
  'phone_form_sub_header':
      'Digite seu WhatsApp para entrar. Seus dados estão seguros e você não precisa de senha.',
};

final _inputLabels = {
  'code_input_label': 'Código de 6 dígitos',
  'phone_input_label': 'Telefone',
};

final _inputHints = {
  'code_input_hint': 'Código',
  'phone_input_hint': 'Telefone completo',
};

final _formValidation = {
  'empty_delivery_code_input_error': 'Digite o código de entrega',
  'invalid_delivery_code_input_error': 'Código de entrega invalido',
  'invalid_phone_input_error': 'Insira um telefone válido',
};

final _buttonLabels = {
  'verify_code_button': 'Verificar código de entrega',
  'trela_partner_button': 'Sou um parceiro trela',
  'phone_form_deliverer_button': 'Ver detalhes da entrega',
  'phone_form_supplier_button': 'Receber código por WhatsApp',
};

final _alerts = {
  'invalid_delivery_code_error': 'Código de entrega inválido',
  'phone_not_registered_error':
      'este telefone não possuí uma conta de Parceiro Trela.',
};

final Map<String, String> ptBR = {
  ..._headers,
  ..._subHeaders,
  ..._inputLabels,
  ..._inputHints,
  ..._formValidation,
  ..._buttonLabels,
  ..._alerts,
};
