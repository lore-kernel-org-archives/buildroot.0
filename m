From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:28:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/linknx: fix build without
 cppunit
In-Reply-To: <20190421173935.14990-1-fontaine.fabrice@gmail.com>
References: <20190421173935.14990-1-fontaine.fabrice@gmail.com>
Message-ID: <20190422222844.5df8a8a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Apr 2019 19:39:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/4b042b7e18425690ec26b4977865516bedcb9edb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...2-configure.ac-always-define-CPPUNIT.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/linknx/0002-configure.ac-always-define-CPPUNIT.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
