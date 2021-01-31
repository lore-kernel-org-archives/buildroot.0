From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:54:18 +0100
Subject: [Buildroot] [PATCH 1/3] package/intel-mediadriver: fix build
 with gcc 10
In-Reply-To: <20210131133200.3976386-1-fontaine.fabrice@gmail.com>
References: <20210131133200.3976386-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131215418.553f6b89@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Jan 2021 14:31:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/d5ab36026a66a4f371fb6ef6c9ecf43e9617d119
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Werror=format-overflow-under-gcc-10.patch | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
