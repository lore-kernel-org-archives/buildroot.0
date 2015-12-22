From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 18:00:28 +0100
Subject: [Buildroot] [PATCH v2] emlog: new package
In-Reply-To: <1450780596-23774-1-git-send-email-joris.lijssens@gmail.com>
References: <1450780596-23774-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151222180028.2684eac8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Tue, 22 Dec 2015 11:36:36 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
> Changes v1 -> v2:
>  - use kernel-module infra
>  - use TARGET_CONFIGURE_OPTS
>  - add extra comments
>  - add dependcy on the linux kernel

Applied with a number of extra changes:

    [Thomas:
     - update to the latest github version, which has a number of
       fixes/improvements compared to the latest tag.
     - add a patch to fix the build of the kernel module with recent
       kernel versions (>= 3.19).
     - use $(INSTALL) -D with a full destination path.
     - rewrap Config.in help text, lines were too long.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
