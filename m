From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:37:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/nano: fix tiny build
In-Reply-To: <20210111190902.668095-1-bernd.kuhls@t-online.de>
References: <20210111190902.668095-1-bernd.kuhls@t-online.de>
Message-ID: <20210111223711.090b06c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 20:09:02 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Since upstream commit
> https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790
> 
> --enable-color --enable-nanorc are needed for libmagic support in tiny
> builds.
> 
> Fixes:
> http://autobuild.buildroot.net/results/248/24894e62d6cf89d078959b12e67596c821d64696/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/nano/nano.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
