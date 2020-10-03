From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 08:04:51 +0200
Subject: [Buildroot] [PATCH] package/bison: disable libtextstyle
In-Reply-To: <2768149d816c4106d4fe2c1b8753c3487555901b.1601183309.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 27 Sep 2020 08:08:29 +0300")
References: <2768149d816c4106d4fe2c1b8753c3487555901b.1601183309.git.baruch@tkos.co.il>
Message-ID: <87362v26bg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Recent bison versions added support for fancy error output using gettext
 > provided libtextstyle. The Buildroot gettext version does not provided
 > all needed features. However host-bison might detect host installed
 > libtextstyle at configure time, but fail at run time because of missing
 > symbols in Buildroot provided libtextstyle.

 > We don't really need fancy output of host packages, so just disable
 > libtextstyle support.

 > Fixes (libpcap):
 > http://autobuild.buildroot.net/results/058e8ec90da3c06e31b31eb94541331cced44db3/
 > http://autobuild.buildroot.net/results/d99dda99722c53730b5964bd4ff1e1281c4ad759/
 > http://autobuild.buildroot.net/results/056fd1246554fe7def416429620175e86530c0a7/

 > Cc: Xogium <contact@xogium.me>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
