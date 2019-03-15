From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:46:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/ulogd: fix musl build
In-Reply-To: <20190315073443.13661-1-fontaine.fabrice@gmail.com>
References: <20190315073443.13661-1-fontaine.fabrice@gmail.com>
Message-ID: <20190315214652.3d963c3d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 08:34:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/26fefd491a8a313c12d62c5f522ddfd48decf6c9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-ulogd-fix-build-with-musl-libc.patch      | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
