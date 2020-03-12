From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 16:11:18 +0100
Subject: [Buildroot] [PATCH] package/util-linux: fix build for riscv64
 and powerpc64le
In-Reply-To: <CAJ4jsafdXUTt262zgxXykxpYK9AyVjt3_MsSVf8RJ5v3m=hZGQ@mail.gmail.com>
References: <20200312114759.31764-1-unixmania@gmail.com>
 <20200312145005.3c16bec0@windsurf>
 <CAJ4jsafdXUTt262zgxXykxpYK9AyVjt3_MsSVf8RJ5v3m=hZGQ@mail.gmail.com>
Message-ID: <20200312161118.4150ce4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 10:54:52 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> The patches are not mine and are already properly signed:
> 
> Signed-off-by: Sami Kerola <kerolasa@iki.fi>
> Signed-off-by: Karel Zak <kzak@redhat.com>

We require contributors to on top of that add their own Signed-off-by.
It's been like this for several years in the Buildroot project. Have a
look, all patches in packages do have the original authors
Signed-off-by, plus the Signed-off-by of the Buildroot contributor who
brought the change into Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
