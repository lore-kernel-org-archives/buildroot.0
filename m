From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:18:07 +0200
Subject: [Buildroot] [PATCH 0/8] Fix the Config.in prefix of a number of
 options
In-Reply-To: <20180513190737.26079-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 13 May 2018 21:07:29 +0200")
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sh6kiu7k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > This series was started from Petr Vorel's patch fixing libmediaart
 > options, which had a wrong prefix. I started writing an additional
 > check in check-package for this mistake, and thanks to it, I
 > discovered a number of other issues, fixed by this patch series.

 > Best regards,

 > Thomas

 > Petr Vorel (1):
 >   libmediaart: rename options to have proper prefix

 > Thomas Petazzoni (7):
 >   bluez5_utils: rename options to have the proper suffix
 >   jquery-ui-themes: rename options to have proper prefix
 >   libftdi: rename option to have proper prefix
 >   ipsec-tools: rename options to have proper prefix
 >   janus-gateway: rename options to have proper prefix
 >   ti-sgx-km: rename options to have proper prefix

Committed all of these, thanks. The improvements to Config.in.legacy can
be handled as a followup series.

>   utils/check-package: verify the prefix of package Config.in options

But not this one as there was quite some feedback on this.

-- 
Bye, Peter Korsgaard
