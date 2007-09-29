From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 30 Sep 2007 00:12:03 +0200
Subject: [Buildroot] --with-abi=<empty> ... during gcc build
In-Reply-To: <20070929204914.GU20951@aon.at>
References: <1191087530.5322.275.camel@elrond.atmel.sweden>
	<20070929182857.GS20951@aon.at>
	<1191097947.5322.282.camel@elrond.atmel.sweden>
	<20070929204914.GU20951@aon.at>
Message-ID: <20070929221203.GY20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 10:49:14PM +0200, Bernhard Fischer wrote:
>On Sat, Sep 29, 2007 at 10:32:26PM +0200, Ulf Samuelsson wrote:

>>I think this is why I get an EABI compiler
>>even when OABI is selected in buildroot.
> 
>grep -i abi .config
>once again, please.
>>
>>I fo not know if --with-abi=32 is the right thing to do for ARM
>>when OABI is wanted, so if you know it is different, pls change.

I've reverted this and the renaming by now, and for arm and mips the abi
is fine again (talking about r20130). Please show me your abi settings
like above.
