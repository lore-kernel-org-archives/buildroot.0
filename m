From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:53:35 +0100
Subject: [Buildroot] [PATCH 1/1] squid: fix static build with libxml2
In-Reply-To: <20181201182845.1337-1-fontaine.fabrice@gmail.com>
References: <20181201182845.1337-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201215335.155a1408@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 19:28:45 +0100, Fabrice Fontaine wrote:
> Use pkg-config to find libxml2 to fix static build of squid
> Add SQUID_AUTORECONF = YES and remove ac_cv_libxml2_include (not needed
> anymore)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7f23eb98c311b294c7f0e165279fa26909a5ff93
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re.ac-use-pkg-config-to-find-libxml2.patch | 79 +++++++++++++++++++
>  package/squid/squid.mk                        |  3 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 package/squid/0001-configure.ac-use-pkg-config-to-find-libxml2.patch

Applied to master, thanks. Really nice to see a pkg-config based
solution, and this solution being submitted upstream. Nice work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
