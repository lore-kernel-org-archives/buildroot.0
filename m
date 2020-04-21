From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:38:58 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/mbuffer: fix build with c89 or c99
In-Reply-To: <20200421185029.4150377-1-fontaine.fabrice@gmail.com>
References: <20200421185029.4150377-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421213858.2e5d599a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 20:50:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Yann E. Morin):
>  - Move AC_USE_SYSTEM_EXTENSIONS before AC_C_RESTRICT

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
