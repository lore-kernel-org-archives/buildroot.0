From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:08:43 +0200
Subject: [Buildroot] [PATCH 1/1] gflags: define NO_THREADS if toolchain
 doesn't support threads
In-Reply-To: <1434015638-27165-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1434015638-27165-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20150611220843.515b36cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On Thu, 11 Jun 2015 15:10:38 +0530, Rahul Bedarkar wrote:
> Fixes:
> http://autobuild.buildroot.net/results/a42/a4288ed5050ce0d14e589745bf26c0a95acf645e/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/gflags/gflags.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
