From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 23:05:17 +0200
Subject: [Buildroot] [PATCH] Reiserfsprogs
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6EE83277A@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE83116F@ex-mb1.corp.adtran.com>
 <20160628181846.25cc7912@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE831CFF@ex-mb1.corp.adtran.com>
 <20160629120422.5d17355b@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE83277A@ex-mb1.corp.adtran.com>
Message-ID: <20160629230517.611d0821@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 18:20:08 +0000, ANDY KENNEDY wrote:

> Yup, I should. However, with four kids, TKD, Cub Scouts, Boy Scouts,
> Girl Scouts, etc, I cannot find the time for _anything_ (though, this
> is not a complaint, just a reason).

Ah, ah real life issues :-)

> My company blocks SMTP north-bound traffic.  And, as you know,
> LookOut! is HORRIBLE for plain text e-mails.  I just wanted to 
> make sure that it wasn't missing tabs (as I manually have to put
> those into the patch when I paste it into my e-mail since the
> M$ clipboard "helps me" by replacing those EVIL tabs with more
> friendly spaces).

The time you lose fighting with those stupid tools most likely largely
outweighs the time needed to set up once for all a working SMTP system.

> Okay, I'll figure out how to construct that so that on -static
> builds, it does the "right thing" and attempt to push it back
> to Jeff.  I was hoping to side step that issue since the
> LIBS=... didn't really hurt anything for dynamic builds as the
> dynamic linker ignores most of those anyway.

This was really just a preference. Mention that it's needed for static
builds, because for dynamic builds, it wasn't needed.

> Another question:  Having been dinged in the past for
> resubmission errors, is the current proper way to construct
> the resubmit:
> 
> ------------------------------------------------------------
> Subject:  [PATCH V2] Reiserfsprogs

No, this should be:

[PATCH v2] reiserfsprogs: new package

git format-patch automatically takes the first line of the commit log
as the e-mail subject.

> and should this be a reply to the original thread or
> a new thread?

A new thread.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
