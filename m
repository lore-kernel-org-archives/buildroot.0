From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 10:34:53 +0200
Subject: [Buildroot] [PATCH] p11-kit: fix detection of certificates path
In-Reply-To: <345d8a4df761992cceb2890c4cd654b0553c850a.1540535353.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 26 Oct 2018 09:29:13 +0300")
References: <345d8a4df761992cceb2890c4cd654b0553c850a.1540535353.git.baruch@tkos.co.il>
Message-ID: <87lg6l5cnm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The p11-kit configure script looked for certificates location on the
 > host. This doesn't work well with cross compilation. Make the
 > certificates patch depend on BR2_PACKAGE_CA_CERTIFICATES, and set the
 > right target location of the path.

 > Fixes:
 > http://autobuild.buildroot.net/results/295/295614d4aa3db9bb35bebbe56e38110f5a2de178/
 > http://autobuild.buildroot.net/results/0fb/0fb454ca0df74a8585cffe8f5d1f5d23cdfdbec6/
 > http://autobuild.buildroot.net/results/ef7/ef71f3d67afba547b5167253fb02476e59152803/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
