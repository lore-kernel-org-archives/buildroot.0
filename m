From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:32:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/c-periphery: disable tests
In-Reply-To: <20200607080124.3449783-1-fontaine.fabrice@gmail.com>
References: <20200607080124.3449783-1-fontaine.fabrice@gmail.com>
Message-ID: <20200610233224.54bb822e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 10:01:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a patch to disable tests, it should be noted that -DBUILD_TESTS=OFF
> is already passed by cmake-infrastructure
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6bbc4de3f857dcb7ff5e6f9fa1441ba4e0af1338
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...MakeLists.txt-add-BUILD_TESTS-option.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
