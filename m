From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:29:19 +0200
Subject: [Buildroot] [PATCH 1/4] package/mjpg-streamer: bump version
In-Reply-To: <20180930190323.3369-1-bernd.kuhls@t-online.de>
References: <20180930190323.3369-1-bernd.kuhls@t-online.de>
Message-ID: <20181008212919.10afab6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Sep 2018 21:03:20 +0200, Bernd Kuhls wrote:
> The currently used github repo from oliv3r does not exist anymore.
> https://sourceforge.net/projects/mjpg-streamer/ shows that the status of
> the original project site is "Inactive" and points to
> https://github.com/jacksonliam/mjpg-streamer as the new site.
> 
> The new maintainer is active so we bump the package to HEAD of its
> master branch which fixes a glibc-related build error:
> http://autobuild.buildroot.net/results/4c8/4c8aac898d4580ed0b8b52cef7779d0f6f6a631f/
> 
> Further changes due to this bump:
> - removed patch 0001, fix was applied upstream:
>   https://github.com/jacksonliam/mjpg-streamer/commit/eb4dafd802b366d9b0310e91e7bb93a1082e7657#diff-511ff6908e8db4543e5a59d0ea4a2f1f
> - switched to CMake
> 
> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mjpg-streamer/0001-musl-pthread.patch | 18 ---------------
>  package/mjpg-streamer/Config.in               |  2 +-
>  package/mjpg-streamer/mjpg-streamer.hash      |  3 ++-
>  package/mjpg-streamer/mjpg-streamer.mk        | 22 +++++--------------
>  4 files changed, 8 insertions(+), 37 deletions(-)
>  delete mode 100644 package/mjpg-streamer/0001-musl-pthread.patch

All four patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
