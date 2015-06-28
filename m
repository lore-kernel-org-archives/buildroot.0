From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:34:07 +0200
Subject: [Buildroot] [PATCH 1/2] glog: add dependency on dynamic library
In-Reply-To: <1435239804-17119-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1435239804-17119-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20150628153407.00a23889@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On Thu, 25 Jun 2015 19:13:23 +0530, Rahul Bedarkar wrote:
> when BR2_STATIC_LIBS=y
> 
> src/symbolize.cc:110:19: error: dlfcn.h: No such file or directory
> 
> glog requires dlfcn.h header. So add dependency on dynamic library
> 
> fixes:
> http://autobuild.buildroot.net/results/75d/75d17ceb764c2c1136047c089a0c554770ca98a4/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/glog/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
