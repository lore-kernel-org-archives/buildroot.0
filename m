From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 21:40:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/aiccu: disable broken
	toolchains on nios2
In-Reply-To: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sun, 30 Nov 2014 17:48:52 +0100")
References: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87mw74xy94.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > As discussed with Thomas
 > http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
 > only the current toolchains are broken:
 > "it's better to blacklist the individual toolchains that are known
 > to be broken, so that if we add another toolchain, we will be able
 > to see if the same bug happens as well or not."

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
