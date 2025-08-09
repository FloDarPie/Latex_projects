\LoadClass[a4paper,12pt]{article} % Classe du document

%--------------------- Packages ------------------------

\RequirePackage[english]{babel} % Language of the document
\RequirePackage[utf8]{inputenc}
\RequirePackage[section]{placeins}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathtools}
\RequirePackage{siunitx}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage[justification=centering]{caption}
\RequirePackage{subcaption}
\RequirePackage{wallpaper}
\RequirePackage{nomencl}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[left=2.5cm,right=2.5cm,top=2cm,bottom=3.5cm]{geometry}

%-------------------- Report information ----------------------

\newcommand{\subject}[1]{\renewcommand{\subject}{#1}}
\newcommand{\topic}[1]{\renewcommand{\topic}{#1}}
\newcommand{\ttitle}[1]{\renewcommand{\ttitle}{#1}}

\newcommand{\students}[1]{\renewcommand{\students}{#1}}
\newcommand{\logo}[1]{\renewcommand{\logo}{#1}}
\newcommand{\uni}[1]{\renewcommand{\uni}{#1}}

\newcommand{\buildmargins}{
\makenomenclature
\pagestyle{fancy}
\fancyheadoffset{1cm}
\setlength{\headheight}{2cm}
\lhead{\includegraphics[scale=0.1]{logos/logo.png}}
\rhead{\nouppercase{\leftmark}}
\rfoot{\thepage}
\cfoot{\textit{\today}}
\lfoot{\subject}
}

\newcommand{\buildcover}{
\begin{titlepage}

	\centering
	\includegraphics[width=0.6\textwidth]{\logo}\par\vspace{1cm} % Logo insertion on the front cover
	{\scshape\LARGE \uni \par} % name of university
	\vspace{1.5cm}
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
	{\huge\bfseries \ttitle \par} \
    \rule{\linewidth}{0.2 mm} \\[1.5 cm]
	\vspace{1cm}
    
	\begin{minipage}{0.5\textwidth}
		\begin{flushleft} \large
		\emph{\textbf{Étudiant :}}\\
        \students\\ % each student should be added using this command
		\end{flushleft}
	\end{minipage}
	~
	\begin{minipage}{0.4\textwidth}
		\begin{flushright} \large
		\emph{\textbf{Profecodesseurs :}} \\
		      Christophe \textsc{Delaunay} \\
            Emmanuel \textsc{Fleury}\\
		\end{flushright}
	\end{minipage}\\[4cm]
    
	\vfill
	{\large \today\par} % Date

\end{titlepage}
}

\newcommand{\toc}{
\tableofcontents
\newpage
}

\newcommand{\insererfigure}[4]{
\begin{figure}[h!]
\centering
\includegraphics[width=#2\textwidth]{#1}
\caption{#3}
\label{fig: #4}
\end{figure}
}


%----------------------------------------------------------
% BIBLATEX
%----------------------------------------------------------

\usepackage[
    backend=biber,
    style=nature,
    sorting=none
]{biblatex}

\addbibresource{biblio.bib}

%----------------------------------------------------------

% PARSKIP

\setlength{\parindent}{18pt} % Ajuste l'indentation horizontale des paragraphes



% Insérer du code
%------------------------------------------------------------

\usepackage{listings}
\usepackage{xcolor}

% Configuration du package listings
\lstset{
  language=C,                 % Définir le langage du code
  basicstyle=\ttfamily\small, % Style de base du texte
  keywordstyle=\color{blue}\ttfamily, % Style des mots-clés
  stringstyle=\color{red}\ttfamily,   % Style des chaînes de caractères
  commentstyle=\color{green}\ttfamily, % Style des commentaires
  numbers=left,                % Numéros de ligne à gauche
  numberstyle=\tiny\color{gray}, % Style des numéros de ligne
  stepnumber=1,                % Pas des numéros de ligne
  numbersep=5pt,               % Espace entre les numéros de ligne et le code
  showspaces=false,           % Ne pas afficher les espaces
  showstringspaces=false,     % Ne pas afficher les espaces dans les chaînes
  showtabs=false,             % Ne pas afficher les tabulations
  frame=single,               % Encadrer le code
  tabsize=2,                  % Taille des tabulations
  captionpos=b,               % Position de la légende
  breaklines=true,            % Couper les lignes trop longues
  breakatwhitespace=false,    % Ne pas couper les lignes aux espaces
  escapeinside={\%*}{*)}      % Échapper les caractères spéciaux
}