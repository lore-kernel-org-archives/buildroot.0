From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 22:59:56 +0200
Subject: [Buildroot] [PATCH] host-cmake: Install with install/fast target
In-Reply-To: <1429818373-1788-1-git-send-email-cedric.marie@openmailbox.org>
References: <1429818373-1788-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <20150423225956.7966a7cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Marie,

On Thu, 23 Apr 2015 21:46:13 +0200, C?dric Marie wrote:
> Use install/fast target in order to skip compilation in installation
> step. The same trick has just been used in pkg-cmake.mk for all CMake
> packages.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>  package/cmake/cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
