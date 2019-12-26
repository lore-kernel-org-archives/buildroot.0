From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 09:39:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/moarvm: fix build with uclibc
In-Reply-To: <20191226082724.2191205-1-fontaine.fabrice@gmail.com>
References: <20191226082724.2191205-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226093923.3db17747@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 09:27:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b88e55dde1acab967023ae49bb1722eadb9cc6ab
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/moarvm/0001-dynload-dynload_unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
