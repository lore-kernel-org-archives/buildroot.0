From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 08:37:34 +0100
Subject: [Buildroot] [PATCH master] dash: fix static link with libedit
In-Reply-To: <d4eb7198beaca0f2f6322f926c736e1147f5cf53.1519968156.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 2 Mar 2018 07:22:36 +0200")
References: <d4eb7198beaca0f2f6322f926c736e1147f5cf53.1519968156.git.baruch@tkos.co.il>
Message-ID: <878tbbdj29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libedit is an optional dependency of dash since commit 651af57cf011e
 > (dash: enable line editting if libedit is selected). Unfortunately, the
 > dash build system does not take into account the ncurses dependency of
 > libedit. Use pkgconf to get that right.

 > Fixes:
 > http://autobuild.buildroot.net/results/801/801e8bc06277978556a301ddf54f609169de37bb/
 > http://autobuild.buildroot.net/results/123/12367267735b9165afef77289460c247aaad494a/
 > http://autobuild.buildroot.net/results/aa7/aa7cc7315d778c15c5165ca6423257a84b957482/

 > Cc: Carlos Santos <casantos@datacom.ind.br>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
