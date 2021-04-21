From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:44:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libplatform: fix build with gcc
 5
In-Reply-To: <20210411083317.199404-1-fontaine.fabrice@gmail.com>
References: <20210411083317.199404-1-fontaine.fabrice@gmail.com>
Message-ID: <20210421224428.55d8a49b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Apr 2021 10:33:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build with gcc 5 is broken since latest bump in commit
> 977f5fd13480699d94e0ba63d9afae94b71906e6
> 
> Instead of updating workaround, use a patch that has been submitted
> upstream
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2b1922f99b1c213b4e28a5b1a11879f4e28c202f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...require-c-11-as-the-minimum-standard.patch | 26 +++++++++++++++++++
>  package/libplatform/libplatform.mk            |  4 ---
>  2 files changed, 26 insertions(+), 4 deletions(-)
>  create mode 100644 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
