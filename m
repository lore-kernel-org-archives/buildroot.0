From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:20:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/aespipe: bump version to 2.4f
In-Reply-To: <20191026082120.10719-1-bernd.kuhls@t-online.de>
References: <20191026082120.10719-1-bernd.kuhls@t-online.de>
Message-ID: <20191026152058.6d5ec801@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 10:21:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated link to package homepage since old link is just a redirect now.
> 
> Added sha1 and md5 hashes provided by upstream.
> 
> Removed -no-pie workaround after upstream added a check in configure,
> quoting ChangeLog:
> 
> - Added configure script autodetection for x86/amd64 -fno-pie compile
>   and -no-pie linker flags. These are needed when compiler/linker
>   produces position independent executable (PIE) by default.
> 
> Build-tested host-aespipe on Debian Buster 10.1 using
> "gcc version 8.3.0 (Debian 8.3.0-6)"
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/aespipe/Config.in      |  2 +-
>  package/aespipe/Config.in.host |  2 +-
>  package/aespipe/aespipe.hash   |  5 ++++-
>  package/aespipe/aespipe.mk     | 12 +-----------
>  4 files changed, 7 insertions(+), 14 deletions(-)

Applied to master, thanks. Since host-cc-option was only used by
aespipe, could you cook a patch to drop this macro as well ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
