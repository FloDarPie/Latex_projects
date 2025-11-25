%%
%% This is file `muletter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% muletter.dtx  (with options: `class')
%% 
%% Copyright 2016-2022  Vít Novotný <witiko@mail.muni.cz>
%% Faculty of Informatics, Masaryk University (Brno, Czech Republic)
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version
%% 1.3 of this license or (at your option) any later version.
%% The latest version of this license is available at
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Vít Novotný (VN).
%% Send bug reports, requests for additions and questions
%% either to the fithesis discussion forum at
%% 
%%   http://is.muni.cz/auth/df/fithesis-sazba/
%% 
%% or to the e-mail address <witiko@mail.muni.cz>.
%% 
%% 
%% MODIFICATION ADVICE:
%% 
%% If you want to customize this file, it is best to make a copy of
%% the source file(s) from which it was produced.  Use a different
%% name for your copy(ies) and modify the copy(ies); this will ensure
%% that your modifications do not get overwritten when you install a
%% new release of the standard system.  You should also ensure that
%% your modified source file does not generate any modified file with
%% the same name as a standard file.
%% 
%% You will also need to produce your own, suitably named, .ins file to
%% control the generation of files from your source file; this file
%% should contain your own preambles for the files it generates, not
%% those in the standard .ins files.
%% 
%% The names of the source files used are shown above.
%% 
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{muletter}[2022/08/02]%
\LoadClass[a4paper,10pt,oneside,onecolumn,final]{letter}%
\RequirePackage{graphicx}%
\RequirePackage{xcolor}%
\RequirePackage{etoolbox}%
\RequirePackage{array}%
\RequirePackage{ragged2e}%
\DeclareOption{heros}{%
  \let\muletter@option@heros\relax
}%
\DeclareOption{nofonts}{%
  \let\muletter@option@heros\undefined
}%
\DeclareOption{monochrome}{%
  \let\muletter@option@monochrome\relax
}%
\DeclareOption{color}{%
  \let\muletter@option@monochrome\undefined
}%
\ExecuteOptions{heros, color}%
\ProcessOptions
\ifx\undefined\muletter@option@heros\else
  \RequirePackage[resetfonts]{cmap}%
  \RequirePackage[T1]{fontenc}%
  \RequirePackage{tgheros}%
  \renewcommand{\familydefault}{\sfdefault}
  \RequirePackage{microtype}%
\fi
\parskip=14pt
\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xpt\@xivpt
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\voffset=\dimexpr(-1in + 1.1cm)
\topmargin=0pt
\headheight=2cm
\headsep=0pt
\newlength\muletter@length@address@top@padding
\muletter@length@address@top@padding=-1.7cm
\newlength\muletter@length@metadata@top@padding
\muletter@length@metadata@top@padding=42pt
\newlength\muletter@length@opening@top@padding
\muletter@length@opening@top@padding=36pt
\textheight=24cm
\footskip=1.5cm
\hoffset=\dimexpr(-1in + 2.4cm)
\oddsidemargin=0pt
\textwidth=16.2cm
\marginparsep=0pt
\marginparwidth=0pt
\newlength\muletter@length@label@overhang
\muletter@length@label@overhang=1.2cm
\newlength\muletter@length@label@left@margin
\muletter@length@label@left@margin=0.5cm
\longindentation=0pt
\newlength\muletter@temp@length
\renewcommand\ps@firstpage{%
  \def\@oddhead{%
    \hspace{-\muletter@length@label@overhang}%
    \begin{minipage}[b][\dimexpr(\footskip-1.75cm)][c]\textwidth
      \textit{\sffamily\fontsize{11}{13}\selectfont
    Par lettre recommandée \\ avec accusé de réception,
      }
    \end{minipage}%
    \hspace{-\muletter@length@label@left@margin}%
    % \muletter@subroutine@includegraphics
    %   {\muletter@filename@label}%
    %   {\muletter@filename@label@fallback}%
  }%
  \def\@oddfoot{\sffamily\fontsize{7}{9}\selectfont
    \color{muletter@color@secondary}%
    \hspace{-\muletter@length@label@overhang}%
    \thepage/\pageref{muletter@lastpage@letter%
      \themuletter@counter@letterno}%
  }%
}%
\renewcommand\ps@plain{%
  \let\@oddhead\@empty
  \def\@oddfoot{\sffamily\fontsize{7}{9}\selectfont
    \color{muletter@color@secondary}%
    \hspace{-\muletter@length@label@overhang}%
    \thepage/\pageref{muletter@lastpage@letter%
      \themuletter@counter@letterno}%
  }%
}%
\pagestyle{plain}%
\let\muletter@original@letter\letter
\renewcommand\letter[1]{%
  \muletter@original@letter{#1}%
  \stepcounter{muletter@counter@letterno}%
}%
\let\muletter@original@endletter\endletter
\renewcommand\endletter{%
  \label{muletter@lastpage@letter\themuletter@counter@letterno}%
  \muletter@original@endletter
}%
\AtEndDocument{%
  \label{muletter@lastpage@letter\themuletter@counter@letterno}%
}%
\renewcommand*{\opening}[1]{%
  \thispagestyle{firstpage}%
  \vspace*\muletter@length@address@top@padding
  \leavevmode\hfill
  {%
    \bfseries\fontsize{11}{14.5}\selectfont
    \begin{minipage}{.45\textwidth}%
      \toname \\ \toaddress
    \end{minipage}%
  }%
  \\[\muletter@length@metadata@top@padding]
  {\sffamily\fontsize{8}{14}\selectfont
  \begin{tabular}{%
      @{}p{.265\textwidth}%
      @{}p{.335\textwidth}%
      @{}p{.22\textwidth}%
      @{}p{.25\textwidth}@{}}%
      \textcolor{muletter@color@secondary}{%
      Date de rédaction :} &
      \textcolor{muletter@color@secondary}{%
      Information de contact :} &
      \textcolor{muletter@color@secondary}{%
      Adresse postale:} &
      \textcolor{muletter@color@secondary}{%
      Complémént d'adresse :} \\

    \mbox{\muletter@data@date@received} &
    \mbox{\muletter@data@name@contact}\newline
    \mbox{\muletter@data@email@contact} &
    \mbox{\muletter@data@place}\newline
    \mbox{\muletter@data@date} &
    \mbox{\muletter@data@refno} 
  \end{tabular}}%
  \\[\muletter@length@opening@top@padding]
  {%
    \bfseries\fontsize{11}{14.5}\selectfont
    \muletter@data@subject
    \par
  }%
  #1\par\nobreak
}%

\renewcommand{\closing}[1]{%
  \par\stopbreaks\noindent\raggedright
  \hspace*{\longindentation}%
  \parbox{\indentedwidth}{%
    \ignorespaces #1%
    \\[.5\medskipamount]%
    \ifx\undefined\muletter@data@signature@image@defined
      \rule{0pt}{4\medskipamount}\\
    \else
      \includegraphics[height=4\medskipamount]%
        \muletter@data@signature@image\\
    \fi
    \textbf{\muletter@data@signature}\\
    \muletter@data@designation\strut
    \par
  }%
}%

\newcommand\muletter@def[2][]{%
  \expandafter\muletter@def@command\expandafter*\csname#2\endcsname[1]{%
    \expandafter\renewcommand\expandafter*\csname
      muletter@data@\ifx\@empty#1\@empty#2\else#1\fi\endcsname{##1}%
    \expandafter\let\csname muletter@data@\ifx\@empty#1\@empty#2\else#1\fi
      @defined\endcsname\relax
  }%
  \expandafter\newcommand\expandafter*\csname
    muletter@data@\ifx\@empty#1\@empty#2\else#1\fi\endcsname
    {\textcolor{red}{\textbackslash #2}}
}%

\let\muletter@def@command\renewcommand
\muletter@def{name}%
\muletter@def{signature}%
\muletter@def{address}%
\muletter@def{telephone}%
\muletter@def{date}%
\let\muletter@def@command\newcommand
\muletter@def[name@contact]{contactname}%
\muletter@def{subject}%
\muletter@def{email}%
\muletter@def[email@contact]{contactemail}%
\muletter@def{webpage}%
\muletter@def{bank}%
\muletter@def{account}%
\muletter@def{tin}%
\muletter@def{vatin}%
\muletter@def{place}%
\muletter@def[date@received]{receiveddate}%
\muletter@def{refno}%
\muletter@def[refno@received]{receivedrefno}%
\muletter@def{designation}%
\muletter@def[signature@image]{signatureimage}%
\muletter@def[locale]{letterlocale}%
\letterlocale{%
  \ifx\languagename\undefined
    english%
  \else
    \languagename
  \fi
}%
\newcommand*\muletter@data@locale@logo{%
  \muletter@data@locale
}%
\newcommand*\muletter@data@locale@label{%
  \muletter@data@locale
}%
\muletter@def{workplace}%
\workplace{mu}%
\newcommand*\muletter@pathname@base{%
  muletter/%
}%
\newcommand*\muletter@pathname@logo{%
  \muletter@pathname@base logo/%
}%
\newcommand*\muletter@pathname@label{%
  \muletter@pathname@base label/%
}%
\newcommand*\muletter@pathname@locale{%
  \muletter@pathname@base locale/%
}%
\newcommand*\muletter@filename@logo{%
  \muletter@pathname@logo muletter-\muletter@data@workplace-%
    \muletter@data@locale@logo
    \ifx\undefined\muletter@option@monochrome
      -color%
    \fi
}%
\newcommand*\muletter@filename@logo@fallback{%
  \muletter@pathname@logo muletter-\muletter@data@workplace-english%
    \ifx\undefined\muletter@option@monochrome
      -color%
    \fi
}%
\newcommand*\muletter@filename@label{%
  \muletter@pathname@label muletter-\muletter@data@workplace-%
    \muletter@data@locale@label
    \ifx\undefined\muletter@option@monochrome
      -color%
    \fi
}%
\newcommand*\muletter@filename@label@fallback{%
  \muletter@pathname@label muletter-\muletter@data@workplace-english%
    \ifx\undefined\muletter@option@monochrome
      -color%
    \fi
}%
\newcommand*\muletter@subroutine@includegraphics[3][]{%
  \begingroup
  \patchcmd{\Gin@ii}{\begingroup}{%
    \begingroup
    \renewcommand{\@latex@error}[2]{%
      \ifx\undefined\muletter@temp@yield
        \let\muletter@temp@yield\relax
        \includegraphics[#1]{#3}%
      \fi
    }%
  }{}{}%
  \includegraphics[#1]{#2}%
  \endgroup
}%
\newif\ifmuletterlogo
\muletterlogofalse
\newcounter{muletter@counter@letterno}%
\definecolor{muletter@color@secondary}{cmyk}{1,0.75,0,0}%
\newcommand\muletter@string[1]{%
  \expandafter\ifx\expandafter\relax\csname muletter@locale@%
    \muletter@data@locale @loaded\endcsname
      \expandafter\global\expandafter\let\csname muletter@locale@%
        \muletter@data@locale @loaded\endcsname\@empty
      \makeatletter
      \input\muletter@pathname@locale
        muletter-\muletter@data@locale .def\relax
      \makeatother
  \fi
  \expandafter\ifx\expandafter\relax\csname muletter@string@%
    \muletter@data@locale @#1\endcsname\relax
      \csname muletter@string@english@#1\endcsname
  \else
    \csname muletter@string@\muletter@data@locale @#1\endcsname
  \fi}%
\let\muletter@locale@english@loaded\@empty
\newcommand*\muletter@string@english@telephone{T}%
\newcommand*\muletter@string@english@email{E}%
\newcommand*\muletter@string@english@webpage{W}%
\newcommand*\muletter@string@english@bank{Bank account}%
\newcommand*\muletter@string@english@account{AN}%
\newcommand*\muletter@string@english@tin{ID}%
\newcommand*\muletter@string@english@vatin{Tax ID}%
\newcommand*\muletter@string@english@afterfooter{%
  Please quote the Reference Number in your reply.}%
\newcommand*\muletter@string@english@yourletter{%
  Your Letter (Ref. No. / Date)}%
\newcommand*\muletter@string@english@refno{Reference Number}%
\newcommand*\muletter@string@english@contactinfo{Contact / E-mail}%
\newcommand*\muletter@string@english@placedate{Place / Date}%





\newcounter{annexe}
\renewcommand{\theannexe}{\Alph{annexe}} 


\newcommand{\annextitle}[1]{%
  \refstepcounter{annexe}%
  \vspace{2em}%
  \begin{center}
    \Large\bfseries #1%
  \end{center}
  \vspace{1em}%
  \hrule\vspace{1em}%
}

\newcommand{\annexref}[1]{\textbf{\ref{#1}}}


\endinput
%%
%% End of file `muletter.cls'.
