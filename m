From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 23:37:29 +0200
Subject: [Buildroot] unable to build fontconfig
In-Reply-To: <1190148550.4516.0.camel@aeglos.sweden.atmel.com>
References: <2D30722FBBDE6749973243F4F01BE984C6568F@dotexchange.dotcorporation.com>
	<1190097350.4064.1.camel@elrond.sweden.atmel.com>
	<2D30722FBBDE6749973243F4F01BE984C656F5@dotexchange.dotcorporation.com>
	<1190148550.4516.0.camel@aeglos.sweden.atmel.com>
Message-ID: <20070919213729.GW20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 18, 2007 at 10:49:10PM +0200, Ulf Samuelsson wrote:
>tis 2007-09-18 klockan 11:25 -0700 skrev Kay McCormick:
>> Sorry, there is a chain of dependencies, but I want to use X.  Does X work at this time?
>> Is there a way to use X without fontconfig
>> 
>
>
>I have failed building all three versions.

I have this patch lying around:
uclibc.org/~aldot/buildroot/package_fontconfig_host-tools.patch
it's ment to be put into package/fonctconfig/host-tools.patch
and needs a patch ontop of that that does an autoreconf.
I don't need fontconfig and will not finish the patch above, so do
whatever you want.

Perhaps that gets you started (i don't remember if that fixed fontconfig
for me as a whole or if it was just one part of the mess). But remember
that ultimatively, fontconfig should be fixed upstream..
>
>> You cannot disable FONTCONFIG because something
>> has "selected" this package.
>> If you, in menuconfig, look at the help item
>> for fontconfig, it will tell you what forces
>> fontconfig to be built.
>> Possibly there is a chain of dependencies.
