From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 22:00:43 +0200
Subject: [Buildroot] [PATCH v3 0/6] engicam: Add new boards and qt5
In-Reply-To: <8e135a7e-57ad-9e40-f482-45bf97900240@mind.be>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
 <CAD6G_RTdxRj=7G0xoqvGWLsjO5aSCrLe1qZrPn6YU6uoevZj4Q@mail.gmail.com>
 <CAD6G_RQovcgik+Kkz_s7jwN_0ztkbmqWF3Kax4w-i67BEn6fTQ@mail.gmail.com>
 <8e135a7e-57ad-9e40-f482-45bf97900240@mind.be>
Message-ID: <20170927220043.44c0ce36@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 21:43:41 +0200, Arnout Vandecappelle wrote:

>  I've been wary about applying this patch series because we don't really want
> qt5 defconfigs for every board. Especially since we already have a mx6/Etnaviv
> defconfig (imx6-sabresd_qt5_defconfig). Initially I even thought you were adding
> three different qt5 defconfigs... But fortunately it's just one.
> 
>  That said, since you're clearly actively working with this, it's worth
> including it.
> 
>  Peter, Thomas, opinions?

I'm also worried about the growing number of defconfig files,
targeting specific use cases. But we don't really have a better way to
support such example configurations other by merging more defconfig
files, so probably we should do it.

As long as we remain aggressive in dropping defconfig files that are
not maintained, I believe we can accept more defconfig files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
