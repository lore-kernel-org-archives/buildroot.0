From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 16:03:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/weston: add patch fixing
 missing fnctl include
In-Reply-To: <20200909182210.2373172-1-james.hilliard1@gmail.com>
References: <20200909182210.2373172-1-james.hilliard1@gmail.com>
Message-ID: <20201025160321.7af79506@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Sep 2020 12:22:10 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is needed to fix a build issue with musl libc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/931/931dc2bfd431dffc4693b62e0889e43709331d8e/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
