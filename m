From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:18:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/zziplib: bump version to 0.13.72
In-Reply-To: <20210110144500.1470681-1-bernd.kuhls@t-online.de>
References: <20210110144500.1470681-1-bernd.kuhls@t-online.de>
Message-ID: <20210116221806.33d34dc3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Jan 2021 15:45:00 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://github.com/gdraheim/zziplib/blob/master/ChangeLog
> 
> Upstream switched the project to cmake and deprecated automake:
> https://github.com/gdraheim/zziplib/commit/5116d90fef820db8a9b3e52ab5a6a11f84dcfc9d
> 
> Removed dependency to host-python3 as it is needed only for tests:
> https://github.com/gdraheim/zziplib/blob/master/test/CMakeLists.txt#L21
> 
> Remove GNUmakefile to fix build error as the real makefile is Makefile.
> GNUnamefile includes files which do not exist after configure and fails
> to include Makefile:
> https://github.com/gdraheim/zziplib/blob/master/GNUmakefile#L60
> 
> Added optional dependency to SDL2.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/zziplib/zziplib.hash |  2 +-
>  package/zziplib/zziplib.mk   | 20 ++++++++++++++++----
>  2 files changed, 17 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
