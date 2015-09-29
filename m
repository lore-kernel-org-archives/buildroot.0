From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:24:22 +0200
Subject: [Buildroot] [PATCH] dos2unix: needs host-gettext
In-Reply-To: <7d8f19570aef65d2409bb7025251f73e6844a889.1443509748.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 Sep 2015 09:55:48 +0300")
References: <7d8f19570aef65d2409bb7025251f73e6844a889.1443509748.git.baruch@tkos.co.il>
Message-ID: <87a8s4zwx5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > dos2unix uses xgettext to generate its .pot file.
 > Fixes:
 > http://autobuild.buildroot.net/results/eda/eda7eeb2fdf7a22c299858ac99d1b1953b15575e/
 > http://autobuild.buildroot.net/results/aaf/aaf2b77f964eb6259e2e4b1d5a13838c3a1eef21/
 > http://autobuild.buildroot.net/results/922/92289b63ebdf133ab910f058ffca8ba34e574208/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
