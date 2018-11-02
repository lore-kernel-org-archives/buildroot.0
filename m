From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 09:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] opencv3: fix build on sparc64
In-Reply-To: <20181021200510.16171-1-fontaine.fabrice@gmail.com>
References: <20181021200510.16171-1-fontaine.fabrice@gmail.com>
Message-ID: <20181102094504.2ac62480@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 22:05:10 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/d27fa3eb3ea600698571837981a3a15d556724ea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...otobuf-fix-compilation-issue-on-s390.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
