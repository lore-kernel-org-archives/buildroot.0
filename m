From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 08:54:21 +0200
Subject: [Buildroot] [PATCH v2] valgrind: bump version to 3.13.0
In-Reply-To: <20180416160900.5632-1-ps.report@gmx.net>
References: <20180416160900.5632-1-ps.report@gmx.net>
Message-ID: <20180417085421.69e54af7@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 18:09:00 +0200, Peter Seiderer wrote:
> - update site
> - add license hash
> - remove 0004-Fixes-for-musl-libc.patch (applied upstream, see [1]) and
>   corresponding autoreconf option
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=f8f1e9cb434cc97ce16586437407a6ac7e6a74a7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - remove autoreconf because of removed patch (spotted by Thomas Petazzoni)
>   - add license files hashes
> ---
>  package/valgrind/0004-Fixes-for-musl-libc.patch | 99 -------------------------
>  package/valgrind/valgrind.hash                  |  6 +-
>  package/valgrind/valgrind.mk                    |  7 +-
>  3 files changed, 7 insertions(+), 105 deletions(-)
>  delete mode 100644 package/valgrind/0004-Fixes-for-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
