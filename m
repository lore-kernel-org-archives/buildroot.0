From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 17:58:44 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
 <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
 <20190611081559.GA24465@t450s.lan>
 <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
Message-ID: <20190612155844.GC2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Gary, All,

On 2019-06-11 11:52 +0200, Arnout Vandecappelle spake thusly:
> On 11/06/2019 10:15, Gary Bisson wrote:
> >>  So, I'm in favour of creating BR2_PACKAGE_HOST_UUU and killing
> >> BR2_PACKAGE_HOST_MFGTOOLS.
> >>
> >>  I marked the patch as Not Applicable in patchwork. If you convince me to do it
> >> this way after all, we can fish it up again.
> > 
> > Ok I can do that. I'll offer another series that deprecates mfgtools and creates
> > a new uuu package.
> 
>  Maybe first Peter and Thomas can confirm that this is the right approach?
> 
>  In summary: the current version of mfgtools creates a completely different
> program called uuu that is used in a completely different way. In other words,
> existing scripts will no longer work. Because of this, my proposal is to create
> a new package for it, and move the existing mfgtools to legacy.

Why ditch the older one? People are almost certain to have scripts that
rely on it, and since the new one is not a drop-in replacement, we can
keep the old one.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
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
