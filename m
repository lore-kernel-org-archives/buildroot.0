From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:43:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump to version 3.9.4
In-Reply-To: <20200810041840.24613-1-asafka7@gmail.com>
References: <20200810041840.24613-1-asafka7@gmail.com>
Message-ID: <20200811224306.6bb3d1e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 07:18:40 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Drop patch (already in version).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...op_mt-as-a-macro-on-uclibc-and-MacOS.patch | 52 -------------------
>  package/libfuse3/libfuse3.hash                |  2 +-
>  package/libfuse3/libfuse3.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 54 deletions(-)
>  delete mode 100644 package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch

As the number of changes between 3.9.2 and 3.9.4 is very small, and
only made of fixes, I applied this to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
