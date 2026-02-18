import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';
class AppColors {
  static const Color primary = Color(0xFFF8BBD0);
  static const Color primaryVariant = Color(0xFFF48FB1);
  static const Color secondary = Color(0xFF80CBC4);
  static const Color background = Color(0xFFFFF9F9);
  static const Color textPrimary = Color(0xFF424242);
  static const Color textSecondary = Color(0xFF757575);
  static const Color cardBackground = Colors.white;
  static const Color iconColor = Color(0xFFE18AAA);
}


void main() {

  runApp(const GuiaGestacaoApp());
}

class GuiaGestacaoApp extends StatelessWidget {
  const GuiaGestacaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia Gestacional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.background,
        ),
        fontFamily: 'Roboto',

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryVariant,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),

        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/main': (context) => const MainScreen(),
        }
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const FirstTrimesterScreen(),
    const SecondTrimesterScreen(),
    const ThirdTrimesterScreen(),
  ];

  static const List<String> _titles = <String>[
    'Guia - 1º Trimestre',
    'Guia - 2º Trimestre',
    'Guia - 3º Trimestre',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            label: '1º Trimestre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            label: '2º Trimestre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            label: '3º Trimestre',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),

            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.iconColor),
            title: const Text('Objetivo do App'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ObjectiveScreen(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: AppColors.iconColor),
            title: const Text('Emergências'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EmergencyScreen(),
              ));
            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              'Versão 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ObjectiveScreen extends StatelessWidget {
  const ObjectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const baseTextStyle = TextStyle(
      fontSize: 16,
      height: 1.5,
      color: AppColors.textSecondary,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetivo do Aplicativo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Olá! Meu nome é Caio Lucas, sou fundador da empresa Calurb.dev e idealizador do aplicativo Guia de Gestação.",
              style: baseTextStyle,
            ),
            const SizedBox(height: 16),
            const Text(
              "O aplicativo nasceu da vontade de acolher, apoiar e organizar a rotina das futuras mamães durante esse momento tão especial. Para desenvolver o projeto, contei com a experiência e colaboração da minha esposa, que me ajudou a compreender as necessidades reais de uma gestante e a transformar essas vivências em uma ferramenta prática e carinhosa.",
              style: baseTextStyle,
            ),
            const SizedBox(height: 16),
            const Text(
              "Nosso propósito é transmitir cuidado, acolhimento e apoio para todas as gestantes, ajudando no acompanhamento de cada fase da gravidez de forma simples, acessível e organizada.",
              style: baseTextStyle,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RichText(
                text: const TextSpan(
                  style: baseTextStyle,
                  children: [
                    TextSpan(text: "⚠️ ", style: TextStyle(fontSize: 18)),
                    TextSpan(
                      text: "Importante: ",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    TextSpan(
                      text: "As informações disponibilizadas aqui possuem caráter educativo e de apoio. Este aplicativo não substitui o acompanhamento médico. Sempre consulte profissionais de saúde para orientações específicas sobre a sua gestação.",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Agradeço por utilizar o Guia de Gestação. Sua avaliação e feedback são fundamentais para que possamos evoluir e tornar este aplicativo cada vez mais completo para as futuras mamães.",
              style: baseTextStyle,
            ),
            const SizedBox(height: 16),
            const Text(
              "🤍 Se este aplicativo foi útil para você e deseja apoiar nosso projeto, contribua de forma voluntária através do Pix: [sua chave Pix aqui]. Toda ajuda nos motiva a continuar melhorando.",
              style: baseTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergências'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contatos de Emergência",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            EmergencyContactTile(
              title: "SAMU (Ambulância)",
              phone: "192",
            ),
            EmergencyContactTile(
              title: "Corpo de Bombeiros",
              phone: "193",
            ),
            EmergencyContactTile(
              title: "Polícia Militar",
              phone: "190",
            ),
            SizedBox(height: 24),
            Text(
              "Recomendações",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "• Em caso de sangramento, perda de líquido, dores fortes ou diminuição dos movimentos do bebê, ligue para seu médico ou vá para a emergência mais próxima.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "• Tenha sempre em mãos seus documentos, o cartão de pré-natal e o contato do seu médico obstetra.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// NOVO WIDGET AUXILIAR ADICIONADO AQUI
class EmergencyContactTile extends StatelessWidget {
  final String title;
  final String phone;

  const EmergencyContactTile({
    super.key,
    required this.title,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.phone_in_talk, color: AppColors.primaryVariant),
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        subtitle: Text(phone,
            style:
            const TextStyle(fontSize: 18, color: AppColors.textSecondary)),
        // Se quiser adicionar função de ligar no futuro, pode ser feita aqui.
        onTap: () {},
      ),
    );
  }
}
class GuidancePageData {
  final String title;
  final String emoji;
  final List<String> items;

  GuidancePageData({
    required this.title,
    required this.emoji,
    required this.items,
  });
}

final List<GuidancePageData> firstTrimesterPages = [
  GuidancePageData(title: "Saúde e Consultas Médicas", emoji: "🩺", items: ["Agendar a primeira consulta de pré-natal (antes da 12ª semana).", "Escolher o profissional que acompanhará a gestação (obstetra/ginecologista).", "Fazer os exames iniciais de pré-natal solicitados pelo médico.", "Verificar tipo sanguíneo e fator Rh.", "Avaliar necessidade de suplementação (ácido fólico, ferro, etc.).", "Checar vacinas em dia com o médico (gripe, hepatite B, dTpa).", "Anotar sintomas e dúvidas para as consultas."]),
  GuidancePageData(title: "Alimentação e Hábitos", emoji: "🥗", items: ["Iniciar ou manter suplementação de ácido fólico.", "Beber bastante água.", "Reduzir cafeína e evitar álcool e cigarro.", "Ajustar a dieta com foco em alimentos naturais e nutritivos.", "Evitar alimentos crus ou mal passados.", "Criar rotina de atividade física leve (com liberação médica)."]),
  GuidancePageData(title: "Bem-estar e Emoções", emoji: "🧘‍♀️", items: ["Descansar sempre que possível (fadiga é comum).", "Criar momentos relaxantes (banho morno, leitura, respiração).", "Registrar sentimentos em um diário ou app de gestação.", "Compartilhar a notícia apenas quando se sentir confortável."]),
  GuidancePageData(title: "Organização Pessoal", emoji: "🏡", items: ["Definir uma pasta (física ou digital) para guardar exames.", "Anotar todas as consultas em agenda ou aplicativo.", "Pesquisar maternidades e convênios.", "Verificar direitos trabalhistas (licença-maternidade, etc.)."]),
  GuidancePageData(title: "Informação e Preparação", emoji: "📚", items: ["Ler sobre as fases da gestação e desenvolvimento do bebê.", "Baixar aplicativos confiáveis para acompanhar semana a semana.", "Participar de grupos ou rodas de gestantes (se desejar).", "Pesquisar cursos online de gestante e amamentação."]),
  GuidancePageData(title: "Extras e Memórias", emoji: "🎀", items: ["Fazer o primeiro ultrassom (transvaginal entre 6 e 9 semanas).", "Registrar a notícia (foto, vídeo, diário da gestação).", "Pensar em ideias de como contar para familiares e amigos.", "Iniciar um álbum da gravidez (físico ou digital)."])
];

final List<GuidancePageData> secondTrimesterPages = [
  GuidancePageData(title: "Saúde e Consultas Médicas", emoji: "🩺", items: ["Manter consultas regulares do pré-natal (mensais).", "Realizar exames do 2º trimestre (hemograma, glicemia, etc.).", "Fazer o ultrassom morfológico (entre 20 e 24 semanas).", "Checar pressão arterial e ganho de peso em todas as consultas.", "Continuar suplementação indicada pelo médico.", "Avaliar vacinação (se não fez no 1º trimestre)."]),
  GuidancePageData(title: "Alimentação e Hábitos", emoji: "🥗", items: ["Manter alimentação equilibrada e rica em fibras.", "Comer de 3 em 3 horas para evitar azia e queda de energia.", "Controlar consumo de açúcar e sal.", "Manter a hidratação.", "Continuar atividade física leve ou moderada (com liberação médica)."]),
  GuidancePageData(title: "Preparação para o Bebê", emoji: "👶", items: ["Definir se deseja fazer revelação do sexo.", "Começar lista de enxoval (roupinhas, fraldas, itens básicos).", "Pesquisar sobre tipos de parto e maternidades.", "Iniciar visitas a maternidades (se possível).", "Avaliar plano de saúde ou SUS para parto.", "Pesquisar sobre curso de gestante e amamentação."]),
  GuidancePageData(title: "Bem-estar e Emoções", emoji: "🧘‍♀️", items: ["Aproveitar a fase de mais disposição para organizar projetos.", "Cuidar da pele (hidratar para prevenir estrias).", "Usar roupas confortáveis e sutiãs adequados.", "Praticar técnicas de respiração e relaxamento.", "Conversar e cantar para o bebê."]),
  GuidancePageData(title: "Organização Pessoal e Casa", emoji: "🏡", items: ["Criar planilha ou lista de gastos com o bebê.", "Pesquisar sobre licença-maternidade e planejar o afastamento.", "Iniciar organização do quarto do bebê.", "Guardar todos os exames em uma pasta.", "Se possível, começar um fundo de reserva para emergências."]),
  GuidancePageData(title: "Informação e Preparação", emoji: "📚", items: ["Ler sobre amamentação e cuidados com o recém-nascido.", "Informar-se sobre o teste do pezinho, orelhinha, etc.", "Pesquisar sobre banco de leite ou armazenamento de leite.", "Estudar sobre sinais de parto prematuro."]),
  GuidancePageData(title: "Extras e Memórias", emoji: "🎀", items: ["Registrar fotos da barriga.", "Escrever no diário da gestação ou aplicativo.", "Pensar em ensaio fotográfico gestante.", "Montar lembrancinhas ou planejar chá de bebê/revelação."])
];

final List<GuidancePageData> thirdTrimesterPages = [
  GuidancePageData(title: "Saúde e Consultas Médicas", emoji: "🩺", items: ["Aumentar a frequência das consultas (quinzenais a semanais).", "Realizar exames do 3º trimestre (cultura de Streptococcus B).", "Controlar pressão e sinais de pré-eclâmpsia.", "Fazer ultrassons de acompanhamento do crescimento do bebê.", "Continuar suplementação conforme orientação médica.", "Verificar necessidade de vacinas (dTpa, gripe)."]),
  GuidancePageData(title: "Alimentação e Hábitos", emoji: "🥗", items: ["Manter alimentação equilibrada e rica em fibras.", "Evitar alimentos muito gordurosos ou condimentados.", "Fracionar refeições para reduzir desconfortos digestivos.", "Beber bastante água.", "Continuar atividade física leve, se liberado pelo médico."]),
  GuidancePageData(title: "Preparação para o Bebê", emoji: "👶", items: ["Finalizar o enxoval e organizar roupas por tamanho.", "Lavar roupinhas e toalhas com sabão neutro.", "Montar a mala da maternidade (mamãe, bebê, acompanhante).", "Preparar o quarto e berço/moisés.", "Verificar documentos para internação.", "Definir e conversar sobre o plano de parto.", "Escolher o pediatra que atenderá o bebê."]),
  GuidancePageData(title: "Bem-estar e Emoções", emoji: "🧘‍♀️", items: ["Praticar técnicas de respiração para o trabalho de parto.", "Fazer exercícios de alongamento para aliviar dores lombares.", "Usar meias de compressão se houver recomendação.", "Cuidar do sono, usando travesseiros de apoio.", "Continuar hidratação da pele para conforto.", "Conversar com o parceiro/família sobre apoio no pós-parto."]),
  GuidancePageData(title: "Organização Pessoal e Casa", emoji: "🏡", items: ["Organizar documentos pessoais e do bebê.", "Conferir licença-maternidade e avisar empresa.", "Montar um kit de primeiros cuidados do bebê em casa.", "Deixar a casa organizada para a chegada do recém-nascido.", "Planejar rede de apoio para os primeiros dias."]),
  GuidancePageData(title: "Informação e Preparação", emoji: "📚", items: ["Reforçar leitura sobre sinais de trabalho de parto.", "Estudar sobre amamentação, pega correta e livre demanda.", "Conhecer sobre cuidados do recém-nascido.", "Aprender sobre saúde mental no puerpério.", "Verificar informações sobre doação do cordão umbilical."]),
  GuidancePageData(title: "Extras e Memórias", emoji: "🎀", items: ["Registrar fotos do barrigão (ensaio ou fotos caseiras).", "Escrever carta ou mensagens para o bebê.", "Preparar lembrancinhas para maternidade (se desejar).", "Planejar visita de familiares após o parto."])
];

class FirstTrimesterScreen extends StatelessWidget {
  const FirstTrimesterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // ATUALIZADO: Adicionamos uma chave de persistência única
    return TrimesterPageView(
      pages: firstTrimesterPages,
      persistenceKey: 'checklist_trimestre_1',
    );
  }
}

class SecondTrimesterScreen extends StatelessWidget {
  const SecondTrimesterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return TrimesterPageView(
      pages: secondTrimesterPages,
      persistenceKey: 'checklist_trimestre_2',
    );
  }
}

class ThirdTrimesterScreen extends StatelessWidget {
  const ThirdTrimesterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return TrimesterPageView(
      pages: thirdTrimesterPages,
      persistenceKey: 'checklist_trimestre_3',
    );
  }
}

class TrimesterPageView extends StatefulWidget {
  final List<GuidancePageData> pages;
  final String persistenceKey;

  const TrimesterPageView({
    super.key,
    required this.pages,
    required this.persistenceKey,
  });

  @override
  State<TrimesterPageView> createState() => _TrimesterPageViewState();
}

class _TrimesterPageViewState extends State<TrimesterPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Map<int, Set<int>> _checkedItems = {};

  @override
  void initState() {
    super.initState();
    _loadCheckedItems();

    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  Future<void> _loadCheckedItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(widget.persistenceKey);

    if (jsonString != null && jsonString.isNotEmpty) {
      final Map<String, dynamic> decodedMap = json.decode(jsonString);
      setState(() {
        _checkedItems = decodedMap.map(
              (key, value) => MapEntry(
            int.parse(key),
            Set<int>.from(value.map((item) => int.parse(item.toString()))),
          ),
        );
      });
    }
  }

  Future<void> _saveCheckedItems() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, List<String>> stringMap = _checkedItems.map(
          (key, value) => MapEntry(
        key.toString(),
        value.map((item) => item.toString()).toList(),
      ),
    );

    final String jsonString = json.encode(stringMap);
    await prefs.setString(widget.persistenceKey, jsonString);
  }
  void _onItemCheckedChange(int pageIndex, int itemIndex, bool isChecked) {
    setState(() {
      if (!_checkedItems.containsKey(pageIndex)) {
        _checkedItems[pageIndex] = <int>{};
      }

      if (isChecked) {
        _checkedItems[pageIndex]!.add(itemIndex);
      } else {
        _checkedItems[pageIndex]!.remove(itemIndex);
      }
    });
    _saveCheckedItems();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.pages.length,
            itemBuilder: (context, pageIndex) {
              final pageData = widget.pages[pageIndex];
              return GuidancePage(
                title: pageData.title,
                emoji: pageData.emoji,
                items: pageData.items,
                checkedItems: _checkedItems[pageIndex] ?? const <int>{},
                onItemCheckedChange: (itemIndex, isChecked) {
                  _onItemCheckedChange(pageIndex, itemIndex, isChecked);
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.pages.length,
                (index) => buildDot(index: index),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.primaryVariant : AppColors.primary,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class GuidancePage extends StatelessWidget {
  final String title;
  final String emoji;
  final List<String> items;
  final Set<int> checkedItems;
  final Function(int, bool) onItemCheckedChange;

  const GuidancePage({
    super.key,
    required this.title,
    required this.emoji,
    required this.items,
    required this.checkedItems,
    required this.onItemCheckedChange,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 48)),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shadowColor: AppColors.primary.withOpacity(0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: AppColors.cardBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  String text = entry.value;
                  return ChecklistItem(
                    text: text,
                    isChecked: checkedItems.contains(index),
                    onTap: (isChecked) {
                      onItemCheckedChange(index, isChecked);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ChecklistItem extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Function(bool) onTap;

  const ChecklistItem({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(!isChecked);
      },
      leading: Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: isChecked ? AppColors.secondary : AppColors.iconColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.textSecondary,
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: AppColors.textSecondary.withOpacity(0.7),
        ),
      ),
    );
  }
}