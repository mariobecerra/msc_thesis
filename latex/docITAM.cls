% Tesis ITAM CLASS -- version 0.1 (13 - Abr - 2015)
% Clase para las tesis del ITAM
%
% 13 - Abr - 2015 	Victor Martinez 	victor.martinez (at) itam.mx
% LICENSE: Creative Commons SA-BY 3.0
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{docITAM}[2015/04/13 v0.01 Template para tesis ITAM]


%%%%%%%%%%%%%%%%%%%%%%%%%% Opcion para declarar tesina %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@thesis{TESIS}
\DeclareOption{tesina}{\renewcommand{\@thesis}{TESINA}}

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{report}%
}

\ProcessOptions\relax

% Usamos como clase base el de report
\LoadClass{report}

%Paquetes requeridos
\RequirePackage{graphicx}
\RequirePackage{amsopn}
\RequirePackage{fancyhdr}

% Utilizamos babel para el manejo de idiomas
\PassOptionsToPackage{english}{babel}
\PassOptionsToPackage{spanish,es-tabla,es-nodecimaldot}{babel}
\RequirePackage{babel}

%Requerimos las definiciones adicionales
\RequirePackage{macros}

%%%%%%%%%%%%%%%%%%%%%%%%%% Espaciados %%%%%%%%%%%%%%%%%%%%%%%%%%
\parindent 0pt
\parskip 1ex
\renewcommand{\baselinestretch}{1.33}

%%%%%%%%%%%%%%%%% Usar numeros romanos en las subsecciones %%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\thesubsubsection{\Roman{subsubsection}}
\setcounter{secnumdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%% Que '\paragraph' se comporte más como subsubsubsection %%%%%%%%%%%%%%%%%%%%%%%%%%
% \makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
            {-2.5ex\@plus -1ex \@minus -.25ex}%
            {1.25ex \@plus .25ex}%
            {\normalfont\normalsize\bfseries}}
% \renewcommand\theparagraph{\Roman{paragraph}}
% \makeatother
% \setcounter{secnumdepth}{4} % how many sectioning levels to assign numbers to
% \setcounter{tocdepth}{4}    % how many sectioning levels to show in ToC


%%%%%%%%%%%%%%%%% Encabezados %%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\rhead{}
\lhead{\nouppercase{\textsc{\leftmark}}}
\renewcommand{\headrulewidth}{0pt}

\renewcommand{\chaptermark}[1]{\markboth{\textsc{\@chapapp}\ \thechapter:\ #1}{}}
\renewcommand\p@subsubsection{\thesubsection.}


%%%%%%%%%%%%%%%%%%%%%%%%%% Definiciones de carrera %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@degree{\ClassWarningNoLine{docITAM}{No Degree specified}}
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\thedegree{\@degree}

%%%%%%%%%%%%%%%%%%%%%%%%%% Definiciones de asesor  %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@advisor{\ClassWarningNoLine{docITAM}{No advisor specified}}
\newcommand\advisor[1]{\renewcommand\@advisor{#1}}
\newcommand\theadvisor{\@advisor}

%%%%%%%%%%%%%%%%%%%%%%%%%% Definiciones del año  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@year{\ClassWarningNoLine{docITAM}{No year specified}}
\renewcommand\year[1]{\renewcommand\@year{#1}} %Report ya tiene un comando \year
\newcommand\theyear{\@year}

%%%%%%%%%%%%%%%%%%%%%%%%%% Comandos de titulo y autor %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\thetitle{\@title}
\newcommand\theauthor{\@author}
\newcommand\thethesis{\@thesis}

%%%%%%%%%%%%%%%%%%%%%%%%%% Portada  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\maketitle{%
	\InputIfFileExists {cover.tex} {\ClassInfo {docITAM} {Loaded cover.tex}} {\ClassError{docITAM}{No cover.tex found!}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Permisos  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\publicationrights{%
	\InputIfFileExists {rights.tex} {\ClassInfo {docITAM} {Loaded rights.tex}} {\ClassError{docITAM} {No rights.tex found!}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Resumen(es) %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\@ifpackageloaded{babel}{%
	\renewenvironment{abstract}[1]{%
		\thispagestyle{empty}\bigskip%
		\begin{center}\begin{otherlanguage}{#1}\bf\abstractname\end{otherlanguage}\end{center}
	}{\clearpage}
}{\ClassWarning{docITAM} {Babel package was not loaded.}}}

%%%%%%%%%%%%%%%%%%%%%%%%%% Env. para citas %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{chapterquote}[2][2em]{%
	\setlength{\@tempdima}{#1}%
	\def\chapquote@author{#2}%
	\parshape 1 \@tempdima \dimexpr\textwidth-2\@tempdima\relax%
	\itshape}{\par\normalfont\hfill--\ \chapquote@author\hspace*{\@tempdima}\par\bigskip}