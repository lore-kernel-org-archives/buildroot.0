From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 12 Jul 2007 18:24:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	package?package/busybox project target/ etc...
In-Reply-To: <200707121751.47836.yann.morin.1998@anciens.enib.fr>
References: <20070712131106.1E690A4757@busybox.net>
	<20070712144244.GB21387@aon.at>
	<1184248611.5175.31.camel@elrond.sweden.atmel.com>
	<200707121751.47836.yann.morin.1998@anciens.enib.fr>
Message-ID: <20070712162411.GA24660@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 12, 2007 at 05:51:47PM +0200, Yann E. MORIN wrote:
>Ulf, Bernhard,
>All,
>
>On Thursday 12 July 2007 15:56, Ulf Samuelsson wrote:
>> tor 2007-07-12 klockan 16:42 +0200 skrev Bernhard Fischer:
>> > On Thu, Jul 12, 2007 at 06:11:06AM -0700, ulf at uclibc.org wrote:
>> > >+PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
>> > >+HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
>> > >+BANNER:=$(strip $(subst ",, $(BR2_BANNER)))
>> > This breaks vi's syntax highlighing, please fix
>> Pls supply a template on what you want me to do.
>
>I guess something like the following:
>
>PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
># Shut up you stupid vim! "

close.
# ")))

Ulf, just do :syntax on

>HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
># Shut up you stupid vim! "
>
>And so on... Maybe comments at the end of the line would do as well...
>
>Regards,
>Yann E. MORIN.
>
>PS. Using vi exclusively here, but no syntax highlighting, which I find
>    ultimately annoying. Thank you, I know (or tend to) what I'm doing! :-)

It's handy at times..
