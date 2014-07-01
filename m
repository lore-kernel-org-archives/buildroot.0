From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jul 2014 15:04:52 +0200
Subject: [Buildroot] [PATCH v2] uclibc: disable parallel build for
	uClibc 0.9.31
In-Reply-To: <1404145013-7553-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Mon, 30 Jun 2014 20:16:53 +0400")
References: <1404145013-7553-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87d2dpgrgr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This is only required for uClibc 0.9.31 and this veriosn is only used by
 > AVR32 so could be safely removed together with AVR32.

 > Even 0.9.32 builds well in parallel (at least on x86) so IMHO there's no need
 > in >= 0.9.33, just disable for a particular broken version.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Anton Kolesov <akolesov@synopsys.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

 > ---
 > In v2 I replaced MAKE_UCLIBC  with UCLIBC_MAKE as suggested by Thomas.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
