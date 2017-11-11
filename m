From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:40:26 +0100
Subject: [Buildroot] [PATCH 1/1] mesa3d: fix build with
 BR2_SHARED_STATIC_LIBS
In-Reply-To: <20171105104958.28634-1-fontaine.fabrice@gmail.com>
References: <20171105104958.28634-1-fontaine.fabrice@gmail.com>
Message-ID: <20171111234026.71ad1af6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Nov 2017 11:49:58 +0100, Fabrice Fontaine wrote:
> mesa3d does not allow to enable both static and shared libraries so if
> BR2_SHARED_STATIC_LIBS is set, disable static
> 
> Fixes https://bugs.busybox.net/show_bug.cgi?id=10326
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
