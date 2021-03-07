From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 22:16:31 +0100
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix checksum of
 license
In-Reply-To: <672c73c1-439b-fef6-d222-185ef20cf33b@grenoble.cnrs.fr>
References: <86d5deb9-b0d8-b655-21b6-0f1f3a3f1f96@grenoble.cnrs.fr>
 <20210307204407.GZ2275@scaer> <20210307205344.GC2275@scaer>
 <672c73c1-439b-fef6-d222-185ef20cf33b@grenoble.cnrs.fr>
Message-ID: <20210307211631.GD2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Edgar, All,

On 2021-03-07 22:08 +0100, Edgar Bonet spake thusly:
> Yann E. MORIN wrote:
> > Not a big deal, but in fact, the real commit that forgot to update the
> > hash was commit f379e75dcd80 (boot/at91bootstrap3: bump to version
> > 3.9.2), not ca1604388a86 as you mention.
> Oops, sorry.

Hehe, no biggy, no biggy. :-)

> Well, actually both f379e75dcd80 and ca1604388a86 bumped the version of
> at91bootstrap3, and both forgot to update the hash of main.c.

Indeed, both submitters forgot to check legal-info. ;-)

But when I tried to review the changes in main.c between 3.9.2. and
3.9.3 (to assess if there was a change in licensing terms), I found no
delta. So, the bump to 3.9.3 did not forget to update the hash: in all
theory, there would have been no update to do since main.c had not
changed.

main.c last changed between 3.9.0 and 3.9.2, so the real culprit for
forgetting to update the hash was really the first bump.

But now this is nit-picking. ;-)

Regards,
Yann E. MORIN.

> Regards,
> 
> Edgar Bonet.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
