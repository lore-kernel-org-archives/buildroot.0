From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jul 2013 23:11:25 +0200
Subject: [Buildroot] [PATCH] toolchain: disable C++ support on AVR32 gcc
	4.2 with uClibc
In-Reply-To: <1373299193-9419-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 8 Jul 2013 17:59:53 +0200")
References: <1373299193-9419-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvvoiwoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In 25c3160092d7 ("uClibc 0.9.31: remove stray kludges/conditions"), a
 Thomas> conditional that prevents the combination gcc 4.2-avr / C++ / locale
 Thomas> with uClibc 0.9.31 was removed. However, it turns out that the same
 Thomas> problem is affecting uClibc 0.9.33, described at
 Thomas> http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/24260.

 Thomas> Therefore, we prevent the combination of gcc 4.2-avr / C++ / locale to
 Thomas> happen.

Committed, thanks.

-- 
Bye, Peter Korsgaard
