From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Apr 2017 23:44:39 +0200
Subject: [Buildroot] [PATCH] libsoc: add host-pkgconf dependency
In-Reply-To: <1491207281-29813-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 3 Apr 2017 10:14:41
 +0200")
References: <1491207281-29813-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87shlnu9tk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Without pkg-config PKG_CHECK_MODULES won't be expanded
 > and ./configure script produces following error message:

 > ./configure: line 12237: syntax error near unexpected token `PYTHON,'
 > ./configure: line 12237: `	PKG_CHECK_MODULES(PYTHON, python-"$PYTHON_VERSION")'

 > Fixes:

 > http://autobuild.buildroot.net/results/86e/86e04bd2b10527130306451e56a7693ed4b4befd

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
