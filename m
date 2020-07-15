From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:27:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix static build
In-Reply-To: <20200714222312.2462708-1-fontaine.fabrice@gmail.com>
References: <20200714222312.2462708-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715172728.7808fa4b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 00:23:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a patch that fix a build failure on version 3.9.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fe2d0f5a956bf23635e51258f92d9ab2e5af7941
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...teec-CMakeLists.txt-fix-static-build.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/optee-client/0001-libckteec-CMakeLists.txt-fix-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
