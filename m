From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Apr 2020 14:57:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/bitstream: update tarball URL
In-Reply-To: <CADvTj4os_y3ZFEN=qzRmi=F=pf+NoR7GPNKE7gezAsGgDq9GWA@mail.gmail.com>
References: <20200416052508.11828-1-bernd.kuhls@t-online.de>
 <20200416074413.2f833747@windsurf.home>
 <CADvTj4qzg-o03A=fDoaOO75j5BJOdcPtSU5Oo-Unqwfn1cOciQ@mail.gmail.com>
 <CADvTj4os_y3ZFEN=qzRmi=F=pf+NoR7GPNKE7gezAsGgDq9GWA@mail.gmail.com>
Message-ID: <20200416145730.21f6922e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 03:38:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Oh, FYI this is probably resolved now, my autobuilder can now get the file from
> get.videolan.org, may have been an internet line issue as I just briefly had the
> fiber line internet connection drop out on it for a few minutes and it
> works after the connection came back seemingly.

We did two things here:

 (1) I asked Peter to put the tarball in sources.buildroot.net, so that
     there is a working fallback.

 (2) I reported the mirror issue on Freenode #videolan, and someone
     replied:

     <garfvl> kos_tom: thanks for the feedback! You are 100% correct,
     there is an error in the "fallback" servers configuration. We will
     try to correct this ASAP.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
