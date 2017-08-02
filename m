From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:47:41 +0200
Subject: [Buildroot] [PATCH] let-me-create: fix build with musl
In-Reply-To: <1501697139-9059-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1501697139-9059-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170802214741.03ee7386@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 23:35:39 +0530, Rahul Bedarkar wrote:
> Add a patch to fix build with musl C library.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/af946fa6fe05ee265e4ac97742b15afeb0cea1ab
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  .../0001-fix-build-with-musl-C-library.patch       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/let-me-create/0001-fix-build-with-musl-C-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
