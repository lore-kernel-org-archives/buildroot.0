From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 22:01:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix static build
 with openssl
In-Reply-To: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
References: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
Message-ID: <20191021220111.76d181c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 22:41:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/65d0528b208c0a470264f7e2433be89425971dd7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ts.txt-fix-static-build-with-openssl.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
