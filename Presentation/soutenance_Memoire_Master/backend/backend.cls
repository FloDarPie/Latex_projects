%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Class selection
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[aspectratio=169,xcolor=dvipsnames]{beamer}
\usepackage[french]{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Package selection
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{hyperref} % To display url
\usepackage{graphicx} % Allows including images
\usepackage{booktabs} % Allows the use of \toprule, \midrule and \bottomrule in tables
\usepackage{tikz}     % To draw
\usetikzlibrary{positioning,arrows.meta}

\usepackage{multicol}

% maths
\usepackage{amsmath}
\usepackage{amssymb}

%fonts
\usepackage{lmodern}
\usepackage[T1]{fontenc}
\usepackage{ragged2e}

%numéroter les captions
\usepackage{caption}

% minted
\usepackage{minted}

% date au format custom jj/mm/aaaa
\usepackage[useregional]{datetime2}
% On force le style français
\DTMsetup{style=french}

% formatage de compteur
\usepackage{fmtcount}

%pour barré des mots avec \sout
\usepackage[normalem]{ulem}


\usepackage[absolute,overlay]{textpos}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Custom command
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\comment}[1]{}

\renewcommand{\figurename}{}
\renewcommand{\author}[1]{\renewcommand{\author}{#1}}
\newcommand{\authors}[1]{\renewcommand{\authors}{#1}}
\newcommand{\uni}[1]{\renewcommand{\uni}{#1}}

\newcommand{\ajd}{\DTMtwodigits{\the\day}/\DTMtwodigits{\the\month}/\the\year}


\newcommand{\progressbar}{%
  \tikz[remember picture,overlay]{
    \def\shift{-1pt}
    % proportion
    \pgfmathsetmacro{\progress}{\insertframenumber/\inserttotalframenumber}
    \pgfmathsetlengthmacro{\barwidth}{\paperwidth * \progress}
    \pgfmathsetmacro{\personalWidth}{\paperwidth-\shift}

    % zone de découpe
    \begin{scope}
      \clip (current page.south west) ++(0pt,-1pt)
        rectangle ++(\barwidth,5pt);

      % on garde l’image avec largeur fixe = page entière
      \node[anchor=south west, inner sep=0pt] at ([xshift=\shift,yshift=\shift]current page.south west)
        {\includegraphics[width=\personalWidth pt,height=5pt]{img/theme/ligne.png}};
    \end{scope}
  }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    Gestion bibliographie
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[
  backend=biber,
  style=alphabetic-verb,
  sorting=nyt
]{biblatex}
\addbibresource{reference.bib}
\renewcommand*{\bibfont}{\scriptsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    Gestion Affichage de l'intro
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifshowtoc
\showtocfalse

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    Packets pour les equations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{amsmath}
\usepackage{empheq}