From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 23:23:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/linphone: fix powerpc build
In-Reply-To: <20200315192529.151801-1-fontaine.fabrice@gmail.com>
References: <20200315192529.151801-1-fontaine.fabrice@gmail.com>
Message-ID: <20200318232346.3d0169dd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2020 20:25:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/d90bca02c2771df8dfbf39892d529fb5f9069656
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re-paths-paths.cpp-fix-powerpc-build.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
