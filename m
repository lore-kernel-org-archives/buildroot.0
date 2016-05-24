From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:40:22 +0200
Subject: [Buildroot] [PATCH 1/3] flann: bump version to fix build with
 gcc 6
In-Reply-To: <1463520230-6127-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463520230-6127-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160524174022.189ce4a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 23:23:48 +0200, Thomas Petazzoni wrote:
> The current version of flann in Buildroot fails to build with gcc 6.x,
> with the following failure:
> 
>   error: call of overloaded 'abs(flann::KDTreeIndex<flann::L2<float> >::ElementType)' is ambiguous
> 
> By bumping the upstream version one commit further, we get an upstream
> fix that fixes the build problem.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/flann/flann.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All three patches applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
