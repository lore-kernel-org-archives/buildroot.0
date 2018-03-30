From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 22:04:08 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: bump to version 0.29
In-Reply-To: <20180308164252.10577-1-fontaine.fabrice@gmail.com>
References: <20180308164252.10577-1-fontaine.fabrice@gmail.com>
Message-ID: <20180330220408.4ce0b1ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Mar 2018 17:42:52 +0100, Fabrice Fontaine wrote:
> Since version 0.28 ncmpc only supports the meson build.
> Therefore, adapt to package infrastructure according to the user manual.
> 
> Add a hash for the license file.
> 
> Add a nmpc entry for myself in DEVELOPERS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS               |  1 +
>  package/ncmpc/ncmpc.hash |  5 ++++-
>  package/ncmpc/ncmpc.mk   | 28 +++++++++++++++++++++++++---
>  3 files changed, 30 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
