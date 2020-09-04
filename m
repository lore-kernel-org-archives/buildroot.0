From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:18:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix build with gcc 10
In-Reply-To: <20200901210017.3471351-1-fontaine.fabrice@gmail.com>
References: <20200901210017.3471351-1-fontaine.fabrice@gmail.com>
Message-ID: <20200904091841.4e702692@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Sep 2020 23:00:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8754bb4f7d749f999d5f8ddfec587470ceec4476
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../minidlna/0001-fix-build-with-gcc-10.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/minidlna/0001-fix-build-with-gcc-10.patch

Applied to master, thanks. I suppose this fix was submitted upstream as
well?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
