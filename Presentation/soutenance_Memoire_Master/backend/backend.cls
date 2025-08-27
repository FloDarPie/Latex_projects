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

\usepackage{multicol}

% maths
\usepackage{amsmath}
\usepackage{amssymb}

%fonts
\usepackage{lmodern}
\usepackage[T1]{fontenc}

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

\newcommand{\oldprogressbar}{
  \tikz[remember picture]{
  \pgfmathsetlengthmacro{\barwidth}{\paperwidth * \insertframenumber / \inserttotalframenumber}
    \path[fill=customBleuSombre!40] (current page.south west) rectangle ++(\barwidth,4pt);
  }
}

\newcommand{\progressbar}{
  \tikz[remember picture,overlay]{
    \def\shift{-1pt}
    % largeur de la barre = proportion d'avancement
    \pgfmathsetlengthmacro{\barwidth}{(\paperwidth - \shift) * \insertframenumber / \inserttotalframenumber}

    % On définit une zone de découpe à gauche 
    \begin{scope}
      \clip (current page.south west) ++(-0pt,-1pt) rectangle ++(\barwidth,5pt);
      % On place l'image du gradient avec une hauteur de 5pt
      \node[anchor=south west, inner sep=0pt] at ([xshift=\shift, yshift=\shift]current page.south west)
        {\includegraphics[width=\barwidth,height=5pt]{img/theme/ligne.png}};
    \end{scope}
  }
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