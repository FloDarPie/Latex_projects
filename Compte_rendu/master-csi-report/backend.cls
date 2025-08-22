\LoadClass[a4paper]{memoir}

%%%%% Packages %%%%%
\usepackage{lmodern}
\usepackage{palatino}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}

% To be removed if you want it in english
\usepackage[french]{babel}

\usepackage{amstext,amsmath,amssymb,amsfonts}
\usepackage{multirow,colortbl}
\usepackage{xspace,varioref}
\usepackage{hyperref, caption}
\usepackage{tikz}
\usetikzlibrary{arrows.meta, bending, positioning, shapes.geometric, arrows, backgrounds, fit, calc}
\usepackage{ragged2e}

\usepackage{minted, subcaption}
\captionsetup[listing]{name=Code}

\usepackage[dvipsnames]{xcolor}
\usepackage{graphicx}

\usepackage{appendix}
\usepackage{makeidx}

\usepackage{bibmemoir}
\addbibresource{bibliography.bib}

%% Customs blocks for redactions 
\usepackage{tcolorbox}
%% More lines for tables 
\usepackage{boldline}
%% Modification de la marge à mon gré
\usepackage{changepage}


\usepackage{tabularx}
\usepackage{array}
\usepackage{adjustbox}
\usepackage{nameref}
\usepackage{eso-pic, afterpage}

\usepackage{pgfplots}
\pgfplotsset{compat=1.18}

\usepackage{listings}
\usepackage{tocloft}

\numberwithin{listing}{chapter}
%% custom style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{lightgray}{gray}{0.9}
\definecolor{inria-2024-gris-bleu}{HTML}{384257}
\definecolor{secure-green}{RGB}{144, 238, 144}   % Vert pâle
\definecolor{unknown-orange}{RGB}{255, 204, 153} % Orange pâle
\definecolor{insecure-red}{RGB}{255, 153, 153}   % Rouge pâle

% custom commands
\newcommand{\version}[1]{\def\theversion{#1}}
\newcommand{\subtitle}[1]{\def\thesubtitle{#1}}

\newcommand{\authors}[1]{\def\theauthors{#1}\author{#1}}
\newcommand{\supervisor}[1]{\def\thesupervisor{#1}}
\newcommand{\tutor}[1]{\def\thetutor{#1}}

% translation for custom words
\newcommand{\authorname}{Author}
\newcommand{\authorsname}{Authors}
\newcommand{\supervisorname}{Supervisor}
\newcommand{\tutorname}{Tutor}

\newcommand{\thepartname}{Part}

\ifdefined\addto{%
\addto{\captionsfrench}{\renewcommand{\authorname}{Auteur}}%
\addto{\captionsfrench}{\renewcommand{\authorsname}{Auteurs}}%
\addto{\captionsfrench}{\renewcommand{\supervisorname}{Superviseur}}%
\addto{\captionsfrench}{\renewcommand{\tutorname}{Tuteurs}}}
\addto{\captionsfrench}{\renewcommand{\thepartname}{Partie}}
\else{}
\fi

% custom box for redacting memoir
\newtcolorbox{Acorriger}[1]{
    colback=blue!5!white,
    colframe=blue!75!black,
    fonttitle=\bfseries,
    title=#1
}

\newtcolorbox{CitationBox}[1]{
    colback=gray!5!white,
    colframe=gray!50!black,
    fonttitle=\bfseries,
    title=#1,
    arc=2pt,
    boxrule=1pt,
    left=6pt,
    right=6pt,
    top=6pt,
    bottom=6pt,
}

% For rendering table
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}

%%%%% Setting Titlepage %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pretitle{
  \begin{tikzpicture}[overlay]
    \node[anchor=south west,inner sep=0] (image1) at (9.6,1) {\includegraphics[scale=0.6]{pictures/Universite_de_Bordeaux.pdf}};  
  \end{tikzpicture}
  \flushleft\Huge\bfseries\textsf}

\posttitle{\\[-.65em]\rule{\linewidth}{1.5mm}\\[-.65em]
\ifx\thesubtitle\undefined%
\else%
  \hfill{\large\itshape \thesubtitle}%
\fi
\centering
\vfill
\iflanguage{french}{
  {\Huge\bfseries Mémoire de fin d'étude}
}{
  {\Huge Master Thesis}
}\\
\vspace{1.25em}
\iflanguage{french}{%
  \LARGE
  Master \emph{Sciences et Technologies},\\
  Mention \emph{Informatique},\\
% Mention \emph{Mathématiques},\\
  Parcours \emph{Cryptologie et Sécurité Informatique}.\\
  \par\hfill%
}{%
  \LARGE
  Master in \emph{Sciences and Technologies},\\
  Specialty in \emph{Computer Science},\\
% Specialty in \emph{Mathematics},\\
  Track \emph{Cryptology and Computer Security}.\\
  \par\hfill
}}

%% author
\preauthor{\vspace{\fill}\\
\ifx\theauthors\undefined%
  \flushleft\textbf{\large\authorname}\\
\else%
  \flushleft\textbf{\large\authorsname}\\
\fi
\small}
\postauthor{\vspace{1em}
\ifx\thesupervisor\undefined%
\else%
  \newline\textbf{\large\supervisorname}\\\thesupervisor\\[1em]%
\fi
\ifx\thetutor\undefined%
\else%
  \textbf{\large\tutorname}\\\thetutor%
\fi
\\[-.25em]
\rule{\linewidth}{1mm}\\[-.25em]}

%% version and date
\predate{\hspace{\fill}
\ifx\theversion\undefined%
\else%
  version~\theversion~--~%
\fi}
\postdate{}

%% chapters style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapterstyle{veelo}
\usepackage{geometry}

% Configuration des marges avec une marge intérieure plus grande
\geometry{
    a4paper,
    inner=30mm, % Marge intérieure (côté reliure)
    outer=40mm, % Marge extérieure
    top=20mm, % Marge du haut
    bottom=20mm, % Marge du bas
}

%% parts style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\thepart}{\arabic{part}}

\renewcommand*{\parttitlefont}{\chaptitlefont\Huge}
\renewcommand*{\partnamefont}{\chapnamefont\HUGE}
\renewcommand*{\partnumfont}{\chapnumfont\HUGE}

\renewcommand{\beforepartskip}{\vspace*{\fill}}
\renewcommand{\midpartskip}{\vspace{.5em}\hrule height 1.5mm \vspace{.5em}}
\renewcommand{\afterpartskip}{\vspace*{\fill}}

% table of contents
\renewcommand*{\cftpartname}{\thepartname}
\renewcommand*{\cftpartpresnum}{\space}
\renewcommand*{\cftpartaftersnum}{.}
\renewcommand*{\cftpartaftersnumb}{\space}

\cftpagenumbersoff{part}
\renewcommand{\cftpartafterpnum}{\protect\\[-.75em]%
  \protect\mbox{}\protect\hrule\par}

\renewcommand{\cftchapterdotsep}{4}


%% index generation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeindex

% Simplification de l'indexation
\newcommand{\indexed}[1]{#1\index{#1}}

%% Fbox rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\fboxrule}{2pt} % Épaisseur du cadre
\setlength{\fboxsep}{0pt} % Ecarte entre image et cadre

%%%%% Useful macros %%%%%
\newcommand{\latinloc}[1]{\ifx\undefined\lncs\relax\emph{#1}\else\textrm{#1}\fi\xspace}
\newcommand{\etc}{\latinloc{etc}}
\newcommand{\eg}{\latinloc{e.g.}}
\newcommand{\ie}{\latinloc{i.e.}}
\newcommand{\st}{\ensuremath{\text{\xspace s.t.\xspace}}}


%%%%% Report Title %%%%%
\title{Analyse automatisée d'une bibliothèque cryptographique}
\subtitle{Détection de failles par canal auxiliaire par analyse statique et symbolique}

\author{Florian Duzes \texttt{<florian.duzes@u-bordeaux.fr>}}

% If several authors use \authors{}
%\authors{Jean Dupont \texttt{<jean.dupont@etu.u-bordeaux.fr>}\\
%Stéphanie Martin \texttt{<stephanie.martin@etu.u-bordeaux.fr>}}

\supervisor{Emmanuel Fleury \texttt{<emmanuel.fleury@u-bordeaux.fr>}}

\tutor{Aymeric Fromherz\texttt{<aymeric.fromherz@inria.fr>}\\
Yanis Sellami\texttt{<yanis.sellami@cea.fr>}\\Sebastien Bardin\texttt{<sebastien.bardin@cea.fr>}}
\version{1.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforechapterskip}{6pt}
\setlength{\cftbeforepartskip}{18pt}

\renewcommand{\memchapinfo}[4]{%
  \addtocontents{lol}{\protect\addvspace{10pt}}}
 
\newcommand{\l@listing}{%
  \@dottedtocline{1}{1.5em}{4em}
}

\renewcommand{\listoflistings}{%
  \section*{Liste des codes}%
  \@starttoc{lol}%

}

\renewcommand{\listoffigures}{%
  \section*{Liste des figures}%
  \@starttoc{lof}%
}

\renewcommand{\listoftables}{%
  \section*{Liste des tables}%
  \@starttoc{lot}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DOS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{wrapfig}

\newcommand{\darklogo}[2][1]{%
  \begin{tikzpicture}
    \node[inner sep=0pt] (logo) {\includegraphics[height=#1cm, keepaspectratio]{#2}};
  \end{tikzpicture}%
}

\newcommand{\lastpage}{%
  \newpage\null\thispagestyle{empty}\newpage
  \clearpage
  \thispagestyle{empty}%
  \pagestyle{empty}%
  %
  % --- Image fixe à gauche + texte à droite ---
  \begin{wrapfigure}{l}{0.25\textwidth}
    \vspace{24pt} % pour coller en haut
    \includegraphics[trim=18cm 5cm 8cm 10cm, clip, width=\linewidth]{pictures/page_garde.jpeg}%
  \end{wrapfigure}


  \noindent
  \raggedright
  \Huge \hfill Résumé \bigbreak
  \normalsize
  \input{chapters/abstract_texte.tex}
  %
  \vfill
  \begin{figure}[!b]
    \rule{\textwidth}{1pt}
    \noindent
    \hfill{\darklogo[1]{pictures/Universite_de_Bordeaux.pdf}}%
    \hfill{\darklogo[0.8]{pictures/Inria-logo-rouge.png}}%
    \hfill{\darklogo[1]{pictures/LOGO_CEA_ORIGINAL_2022.png}}\hfill
  \end{figure}

}

