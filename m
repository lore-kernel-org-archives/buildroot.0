From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:19:52 +0200
Subject: [Buildroot] [PATCH] librtlsdr: disable shared library target
In-Reply-To: <1411561915-3225-1-git-send-email-yuvaraj.patil@wipro.com>
References: <1411561915-3225-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <20141001191952.03fdfeea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yuvaraj Patil,

On Wed, 24 Sep 2014 18:01:55 +0530, Yuvaraj Patil wrote:
> Disable shared library target if BUILD_SHARES_LIBS is OFF.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d68/d68a23e2a57fd5430d74b8151931f36959d9578d//
> 
> Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
> ---
>  ...01_disable_shared_library_target_in_build.patch |   80 ++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch

Thanks, patch applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
