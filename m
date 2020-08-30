From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 22:19:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/librsvg: bump to version
 2.48.8
In-Reply-To: <20200830084138.4047798-1-fontaine.fabrice@gmail.com>
References: <20200830084138.4047798-1-fontaine.fabrice@gmail.com>
Message-ID: <20200830221942.68c03eb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Aug 2020 10:41:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add a dependency to host-rustc
> - libcroco is not a dependency since
>   https://gitlab.gnome.org/GNOME/librsvg/-/commit/03ce9bd7875ef2a91979bc4f7d6fa5188cfd785c
> - gtk3 is not a dependency since
>   https://gitlab.gnome.org/GNOME/librsvg/-/commit/522aeee0ca9b4ff3940bea2d13ebb77ec6c064a6
> - cairo script is mandatory since switch to rust

I remember we already tried to upgade librsvg to a version that was
written in Rust, and had to revert in commit
4182346f4bbe03c6fa1dababeeaeae2dc5e8223f. Have things improved since
then ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
