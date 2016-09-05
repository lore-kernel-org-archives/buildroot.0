From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:16:23 +0200
Subject: [Buildroot] [PATCH] micropython: replace local fix with
 upstream one
In-Reply-To: <20160905091615.9075-1-judge.packham@gmail.com>
References: <20160905091615.9075-1-judge.packham@gmail.com>
Message-ID: <20160905221623.419bd8b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 21:16:15 +1200, Chris Packham wrote:
> The fix from commit 26248571b625 ("micropython: fix build failures") was
> applied upstream. This replaces the local buildroot fix with the patch
> that was accepted upstream.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  ....c-provide-mp_raw_code_load_file-for-any-.patch | 27 ----------------------
>  package/micropython/micropython.hash               |  1 +
>  package/micropython/micropython.mk                 |  1 +
>  3 files changed, 2 insertions(+), 27 deletions(-)
>  delete mode 100644 package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
