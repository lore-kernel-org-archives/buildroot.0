From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 17:31:21 +0200
Subject: [Buildroot] [PATCH] linux: CONFIG_KERNEL_LZO option requires
	host-lzop
In-Reply-To: <1368431920-22020-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 13 May 2013 09:58:40 +0200")
References: <1368431920-22020-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <871u99shme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 Fabio> When the LZO compression mode is chosen the linux kernel requires
 Fabio> lzop host utility at build time.

Committed, thanks.

-- 
Bye, Peter Korsgaard
