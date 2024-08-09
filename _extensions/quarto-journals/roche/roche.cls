% ------------------------------------------------------------------------------
\ProvidesClass{roche}[2023/07/12 Moritz Lang: Roche Quarto Template]
\NeedsTeXFormat{LaTeX2e}

% ------------------------------------------------------------------------------
% LOAD DEFAULT CLASS

\newif\if@consulting
\newif\if@study
\newif\if@report
\newif\if@comment

\@consultingfalse
\@studyfalse
\@reportfalse
\@commenttrue

\DeclareOption{consulting}{\@consultingtrue%
 \@studyfalse \@reportfalse \@commentfalse}
\DeclareOption{study}{\@studytrue%
 \@consultingfalse \@reportfalse \@commentfalse}
\DeclareOption{report}{\@reporttrue%
 \@consultingfalse \@studyfalse \@commentfalse}
\DeclareOption{comment}{\@commenttrue%
  \@consultingfalse \@studyfalse \@reportfalse}

\ProcessOptions       

\LoadClass[
  10pt,
  a4paper,
  oneside,
] {article}

\newcommand{\Plainauthor}[1]{\def\@Plainauthor{#1}}          
\newcommand{\department}[1]{\def\@department{#1}}          
\newcommand{\reviewername}[1]{\def\@reviewername{#1}}          
\newcommand{\reviewerdep}[1]{\def\@reviewerdep{#1}}          
\newcommand{\sponsorname}[1]{\def\@sponsorname{#1}}          
\newcommand{\sponsordep}[1]{\def\@sponsordep{#1}}          

\newcommand{\metainfoversion}[1]{\def\@metainfoversion{#1}}          
\newcommand{\metainfoinfo}[1]{\def\@metainfoinfo{#1}}          
\newcommand{\metainforepo}[1]{\def\@metainforepo{#1}}          
\newcommand{\metainforiskdata}[1]{\def\@metainforiskdata{#1}}          
\newcommand{\metainforiskqms}[1]{\def\@metainforiskqms{#1}}          
\newcommand{\metainforiskcritical}[1]{\def\@metainforiskcritical{#1}}          

% ------------------------------------------------------------------------------
% PACKAGE DEFINITION

\RequirePackage[
  a4paper,
  left = 25mm,
  right = 20mm,
  top = 44mm,
  bottom = 15.5mm,
  headsep = 18mm,
  headheight = 20mm,
  footskip = 5mm, 
%  showframe
]{geometry} % Easily enables to layout pag
\RequirePackage{fancyhdr} % Set header and footer styles
\RequirePackage{graphicx} % Enables loading images
  % Set the location of the graphics path (images can be found here)
  \graphicspath{
    {img/}
  }

\RequirePackage[
  usenames,
  dvipsnames,
  svgnames,
  table
]{xcolor}    % Define colors in the document
\RequirePackage[english]  % German synt
  {babel}
\RequirePackage{lastpage} % To display the last page of the document
\RequirePackage{tabularx}  % needed for title page
\RequirePackage{setspace} % needed for title page
\RequirePackage[nointegrals]{wasysym} % needed for title page
\RequirePackage[linktoc=all]{hyperref}
\hypersetup{
  colorlinks,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black,
  breaklinks=true
}
% Remove indention
\setlength{\parindent}{0pt}

% remove dots in table of contents, list of tables/figures
\makeatletter  %TODO: (ML) Maybe not needed or even should not be used in class fil?!
  \renewcommand\@dotsep{10000}
\makeatother

% This is needed to use the title and author
% in the header and footer (stylesheet)
\makeatletter

  \AtBeginDocument{

    \let\doctitle\@title
    \let\docauthor\@author
    \let\docdate\@date

    %\makeglossaries
  }

\makeatother

% ------------------------------------------------------------------------------
% HEADER/FOOTER PAGE LAYOUT

\pagestyle{fancy}

 % sets both header and footer to nothing
\fancyhf{}
\fancyfoot{}
% remove the header line
\renewcommand{\headrulewidth}{0pt}

% top right header
\lhead{
  \small\doctitle
}

% top left header
\rhead{
 \begin{picture}(1,1)
   \put(-40,0){\includegraphics[height = 1cm]{roche}}
 \end{picture}
}

% The footer shows the title, the author and the page [page]/[total pages]
\rfoot{
  \small{
    \thepage /\pageref*{LastPage}
  }
}

\fancypagestyle{consulting}{

  % sets both header and footer to nothing
  \fancyhf{}
  % remove the header line
  \renewcommand{\headrulewidth}{0pt}

  % top left header
  \lhead{
    \Large{Statistical Analysis Report}\\\small{According to SOP RP0060}
  }

  % Display the roche logo at the right side
   \rhead{
    \begin{picture}(1,1)
      \put(-40,0){\includegraphics[height = 1cm]{roche}}
    \end{picture}
   }

   % The footer shows the title, the author and the page [page]/[total pages]
   \lfoot{
     \small{
       {Roche Diagnostics GmbH}
     }
   }
}

\fancypagestyle{study}{

  % sets both header and footer to nothing
  \fancyhf{}
  % remove the header line
  \renewcommand{\headrulewidth}{0pt}

  % top left header
  \lhead{
    \Large{Statistical Analysis Report}\\\small{According to GSP04}
  }

  % Display the roche logo at the right side
   \rhead{
    \begin{picture}(1,1)
      \put(-40,0){\includegraphics[height = 1cm]{roche}}
    \end{picture}
   }

   % The footer shows the title, the author and the page [page]/[total pages]
   \lfoot{
     \small{
       {Roche Diagnostics GmbH - CPS - Biometry Penzberg}
     }
   }
}

\fancypagestyle{comment}{

  % sets both header and footer to nothing
  \fancyhf{}
  % remove the header line
  \renewcommand{\headrulewidth}{0pt}

  % top right header
  \lhead{
    \bf\Large{Statistical Comment}
  }

  % Display the roche logo at the right side
   \rhead{
    \begin{picture}(1,1)
      \put(-40,0){\includegraphics[height = 1cm]{roche}}
    \end{picture}
   }

  % The footer shows the title, the author and the page [page]/[total pages]
  \rfoot{
    \small{
      \thepage /\pageref*{LastPage}
    }
  }
}

\fancypagestyle{report}{

  % sets both header and footer to nothing
  \fancyhf{}
  % remove the header line
  \renewcommand{\headrulewidth}{0pt}

  % top right header
  \lhead{
    \bf\Large{Statistical Report}
  }

  % Display the roche logo at the right side
   \rhead{
    \begin{picture}(1,1)
      \put(-40,0){\includegraphics[height = 1cm]{roche}}
    \end{picture}
   }

  % The footer shows the title, the author and the page [page]/[total pages]
  \rfoot{
    \small{
      \thepage /\pageref*{LastPage}
    }
  }
}

% ------------------------------------------------------------------------------
% FIRST PAGE FORMATING

\makeatletter
\if@consulting
  \renewcommand{\maketitle}{
  
    \thispagestyle{consulting}
    \null
    \vspace{1cm}
  
    {\Huge\doctitle}
  
    \vspace{2em}
  
    \begin{tabularx}{\textwidth}{|l |X |l |}
      \multicolumn{1}{l}{\textbf{Document History}} & \multicolumn{1}{l}{\textbf{Change Information}} & \multicolumn{1}{l}{\textbf{Effective Date}} \\\cline{1-3}  
      \@metainfoversion  &  \@metainfoinfo  &  \docdate  \\ 
      \hline 
    \end{tabularx}\vspace{2em}
  
    \begin{tabularx}{\textwidth}{|l |X |X |l |l |}\multicolumn{1}{l}{} &
    \multicolumn{1}{l}{\textbf{Name}} & \multicolumn{1}{l}{\textbf{Department}} &
    \multicolumn{1}{l}{\textbf{Date}} & \multicolumn{1}{l}{\textbf{Signature}}\\
    \hline    
    \textbf{Author}  &  \@Plainauthor  &  \@department  &   & \\
    \hline
    \textbf{Reviewer}  &  \@reviewername  &  \@reviewerdep  &    &    \\
    \hline
    \textbf{Sponsor*}  &  \@sponsorname  &  \@sponsordep &    &    \\
    \hline
    \end{tabularx}\vspace{1em}
    
    {\small $^*$With the signature the sponsor confirms:}
    \begin{singlespace*}
      \begin{itemize}\setlength{\itemsep}{0.1pt}
        \item\small{in case that not fully anonymized personal data are included in the analysis data set, that the processing of personal data for this statistical analysis is subject to a proper legal basis within the scope of the analysis. The legal basis check was successfully performed according to the SOPs, F\textunderscore RO0036\textunderscore SOP and F\textunderscore SP0032\textunderscore SOP. The scope of the analysis is described in this report in section "Scope of this Analysis";} 
        \item\small{the approval of risk assessment including the information if or if not this statistical consulting project is in scope of a QMS in Roche and if or if not this statistical consulting project has a relevant impact on the quality of the product or patient safety or is business critical; and }
        \item \small{that the quality of the analysis data set is fit for purpose of this analysis.}
      \end{itemize}
    \end{singlespace*}
    
    \vspace{2em}

    \small{
      {\textbf{Data Integrity:}} \\
      \makeatletter
      \def\temp{}
      \ifx\@metainforepo\temp
        \begin{tabularx}{\textwidth}{X}
          \Square \ All relevant data are archived according to SOP RP0060 at: \\
          \XBox \   Archiving not required.\\
        \end{tabularx}
      \else
        \begin{tabularx}{\textwidth}{X}
          \XBox \ All relevant data are archived according to SOP RP0060 at: \@metainforepo \\
          \Square \   Archiving not required.\\
        \end{tabularx}
      \fi
      \makeatother
      
      \vspace{2em}
      
      {\textbf{Statistical Analysis Specification:}}

      \vspace{0.5em}
      
      {\textbf{Risk assessment:}} \\
      
      \vspace{0.5em}

      \makeatletter
      \def\temp{true} % Assuming the variables are either "true" or "false"
      \ifx\@metainforiskdata\temp
        \ifx\@metainforiskqms\temp
          \ifx\@metainforiskcritical\temp
            % Execute the code when all conditions are true
            \def\tableContent{
              Not fully anonymized personal data are included  & \XBox yes  & \Square no \\
              Project is in scope of a QMS in Roche &\XBox yes  & \Square no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\XBox yes  & \Square no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \Square \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \XBox \  performed successfully by a second person. \\
            }
          \else
            \def\tableContent{
              Not fully anonymized personal data are included  & \XBox yes  & \Square no \\
              Project is in scope of a QMS in Roche &\XBox yes  & \Square no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\Square yes  & \XBox no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \XBox \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \Square \  performed successfully by a second person. \\
            }
          \fi
        \else
          \ifx\@metainforiskcritical\temp
            % Execute the code when all conditions are true
            \def\tableContent{
              Not fully anonymized personal data are included  & \XBox yes  & \Square no \\
              Project is in scope of a QMS in Roche &\Square yes  & \XBox no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\XBox yes  & \Square no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \XBox \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \Square \  performed successfully by a second person. \\
            }
          \else
            \def\tableContent{
              Not fully anonymized personal data are included  & \XBox yes  & \Square no \\
              Project is in scope of a QMS in Roche &\Square yes  & \XBox no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\Square yes  & \XBox no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \XBox \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \Square \  performed successfully by a second person. \\
            }
          \fi
        \fi
      \else
        \ifx\@metainforiskqms\temp
          \ifx\@metainforiskcritical\temp
            % Execute the code when all conditions are true
            \def\tableContent{
              Not fully anonymized personal data are included  & \Square yes  & \XBox no \\
              Project is in scope of a QMS in Roche &\XBox yes  & \Square no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\XBox yes  & \Square no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \Square \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \XBox \  performed successfully by a second person. \\
            }
          \else
            \def\tableContent{
              Not fully anonymized personal data are included  & \Square yes  & \XBox no \\
              Project is in scope of a QMS in Roche &\XBox yes  & \Square no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\Square yes  & \XBox no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \XBox \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \Square \  performed successfully by a second person. \\
            }
          \fi
        \else
          \ifx\@metainforiskcritical\temp
            % Execute the code when all conditions are true
            \def\tableContent{
              Not fully anonymized personal data are included  & \Square yes  & \XBox no \\
              Project is in scope of a QMS in Roche &\Square yes  & \XBox no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\XBox yes  & \Square no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \XBox \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \Square \  performed successfully by a second person. \\
            }
          \else
            \def\tableContent{
              Not fully anonymized personal data are included  & \Square yes  & \XBox no \\
              Project is in scope of a QMS in Roche &\Square yes  & \XBox no \\
              Project has relevant impact on the quality of the product or patient safety \\ 
              or is business critical &\Square yes  & \XBox no \\ 
              % Define your table content here
            }
            \def\tableContentReview{
              \XBox \ not necessary as the processes of this project are not in scope of a QMS in Roche and the project has no relevant impact on the quality of the product or patient safety and is not business critical. \\ 
              \Square \  performed successfully by a second person. \\
            }
          \fi
        \fi
      \fi
      \makeatother

      \begin{tabularx}{\textwidth}{l X X}
        \tableContent
      \end{tabularx}
      
      \vspace{0.5em} 
      
      Statistical verification of this report is\\ 

      \begin{tabularx}{\textwidth}{X} 
        \tableContentReview
      \end{tabularx}
    }
    
    \newpage
  }
\fi

\if@study
  \renewcommand{\maketitle}{

    \thispagestyle{study}
    \null
    \vspace{6cm}

    {\Huge\bf\doctitle}

    \vspace{8mm}

    {\large
    \lineskip .75em%

    \@Plainauthor
    \par}%

    % {\huge\headingfont{#1}\newline}

    \vspace{2cm}

    % {#2}

    \newpage
  }
\fi

\if@report
  \renewcommand{\maketitle}{

    \thispagestyle{report}
    \null
    \vspace{6cm}

    {\Huge\bf\doctitle}

    \vspace{8mm}

    {\large
    \lineskip .75em%

    \@Plainauthor
    \par}%

    % {\huge\headingfont{#1}\newline}

    \vspace{2cm}

    % {#2}

    \newpage
  }
\fi

\if@comment
  \renewcommand\maketitle{

    \thispagestyle{comment}

    \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large \@Plainauthor \par}%       % Set date in \large size.
    \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
    \end{center}\par
    \vskip 3em%
  }                                          
\fi
\makeatother
