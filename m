From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 22 Aug 2007 14:19:50 +0200
Subject: [Buildroot] buildroot-20070720
References: <1187730489.15882.7.camel@86-115-11-152>
	<20070821230818.GS11697@aon.at>
	<1187754477.4494.11.camel@86-115-11-152>
	<20070822080818.GA7523@aon.at>
Message-ID: <00e901c7e4b6$d77a8460$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: "Buildroot" <buildroot@uclibc.org>
Sent: Wednesday, August 22, 2007 10:08 AM
Subject: Re: [Buildroot] buildroot-20070720


> On Wed, Aug 22, 2007 at 05:47:57AM +0200, Ulf Samuelsson wrote:
>>ons 2007-08-22 klockan 01:08 +0200 skrev Bernhard Fischer:
>>> On Tue, Aug 21, 2007 at 11:08:09PM +0200, Ulf Samuelsson wrote:
>>> >Since the buildroot ftp site only maintains one month old tarball,
>>> >this package has already disappeared.
>>> >It would be good if that tarball could be downloadable as well
>>> >so that the diff can be computed.
>>> 
>>> To me this doesn't make any sense at all.
>>> svn co -r'{2007-07-20 00:00}' svn://uclibc.org/trunk/buildroot buildroot
>>> 
>>> What do you want to achieve with a tarball? Doesn't svn diff work just
>>> fine? And, what's special about that 20070720 snapshot in the first
>>> place?
>>
>>Sorry, wrong mailing list.
>>Was intended for an Atmel internal mailing list.
>>The "Evolution" Mail program does not easily show how
>>it completes a mail address.
>>
>>http://www.atmel.no/buildroot/ is based on 20070718.
>>Would like to move this stuff to the main trunk
>>
>>I got an earlier version in the summertime, and did not have
>>the original source so I diffed against the current,
>>and tried to figure out what was added.
>>That was the time, when I reverted some of your patches.
>>
>>Would like to avoid that, so I want the original source.
> 
> Perhaps it would be a good idea if you (atmel) would use an SCM instead
> of tarballs. Would make your life way easier, i imagine. Just a
> thought..
>

They are using "git" and remove all svn info before they enter into their git system.
They do not want to work with svn.

Is there any chance that buildroot is moving over to "git"?.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
