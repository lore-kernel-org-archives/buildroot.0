From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 23:16:06 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs
	$(MAKE)	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <1183837025.19912.17.camel@elrond.sweden.atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
	<000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
Message-ID: <20070707211606.GZ4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 09:37:05PM +0200, Ulf Samuelsson wrote:
>l?r 2007-07-07 klockan 19:29 +0200 skrev Bernhard Fischer:
>> On Sat, Jul 07, 2007 at 06:06:23PM +0200, Ulf Samuelsson wrote:
>> >> >I think someone got it wrong in the "package/mtd/mtd.mk" which says
>> >> >
>> >> >    $(TARGET_CONFIGURE_OPTS) $(MAKE) ...    - build using gcc
>> >> >    
>> >> >which should be:
>> >> >
>> >> >     $(MAKE) $(TARGET_CONFIGURE_OPTS) ...    - build using arm-linux-uclibc-gcc
>> >> 
>> >> yes, the latter is correct. Steven, please repair or elaborate.
>> >> 
>> >
>> >Here are a set of patches to change the position of
>> >TARGET_CONFIGURE_OPTS.
>> >Please review and apply if you agree.
>> >
>> >
>
>Here we go again!

I just replied to this, didn't i?

Ulf, two minor points.
1)
Version your patches, please. This mail had an
TARGET_CONFIGURE_OPTS-2.patch and the one i just replied to had the same
version? At least the patch had the same name..
2) don't send patches both inline and as an attachment, it's
inconvenient (and redundant IMHO). (The 'CFT,PATCH' style from earlier today
works for the majority of clients)
