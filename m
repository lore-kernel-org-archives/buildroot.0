From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:17:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 for SDL2
In-Reply-To: <20180118175415.16715-1-g@maral.me>
References: <20180118174319.378bfb1b@windsurf.lan>
 <20180118175415.16715-1-g@maral.me>
Message-ID: <20180118221745.13fe9f24@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 09:54:15 -0800, Guillermo A. Amaral wrote:
> Tweak build system to play well with Buildroot.
> 
> Signed-off-by: Guillermo A. Amaral <g@maral.me>
> ---
>  .../sdl2/0001-make-cross-compiler-friendly.patch   | 167 +++++++++++++++++++++
>  package/sdl2/sdl2.mk                               |   8 +-
>  2 files changed, 174 insertions(+), 1 deletion(-)
>  create mode 100644 package/sdl2/0001-make-cross-compiler-friendly.patch

Applied to master, thanks. Please submit the patch upstream if not
already done. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
