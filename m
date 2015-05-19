From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:34:38 +0200
Subject: [Buildroot] [PATCH v2] ntp: install after busybox
In-Reply-To: <a09a3696a8c28729f8806aa8a5bf01aa669d25f8.1432026797.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 19 May 2015 12:13:17 +0300")
References: <a09a3696a8c28729f8806aa8a5bf01aa669d25f8.1432026797.git.baruch@tkos.co.il>
Message-ID: <87a8x05pkh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Make sure that ntp installs after busybox so that it overrides the busybox
 > provided ntpd applet.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2:
 >    Don't depend on busybox when busybox is not enabled (Thomas P)

Committed, thanks.

-- 
Bye, Peter Korsgaard
