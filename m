From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:16:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs host-python3
In-Reply-To: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
References: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
Message-ID: <20200309221629.69c9bc90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 12:18:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-python3 is a mandatory dependency since bump to version 4.10.0 and
> https://gitlab.com/samba-team/devel/samba/-/commit/5ddff307b4af5c82d5064745f5bd2c33bd340ced
> because buildtools/bin/waf shebang is set to "/usr/bin/env python3"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2634eb7824beb34f485cf40670f6959515f008ad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/samba4/samba4.mk | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
