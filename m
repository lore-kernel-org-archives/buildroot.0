From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 09:49:26 +0200
Subject: [Buildroot] [PATCH v2 1/2] gflags: new package
In-Reply-To: <1433915449-15994-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1433915449-15994-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1433915449-15994-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20150610094926.033248bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On Wed, 10 Jun 2015 11:20:48 +0530, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Reviewed-by: Abhimanyu Vishwakarma <abhimanyu.v@imgtec.com>
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
> Changes v1 -> v2:
> 	- correct check for toolchain doesn't support threads (suggested by Thomas Petazzoni)
> ---
>  package/Config.in          |  1 +
>  package/gflags/Config.in   | 13 +++++++++++++
>  package/gflags/gflags.hash |  2 ++
>  package/gflags/gflags.mk   | 17 +++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/gflags/Config.in
>  create mode 100644 package/gflags/gflags.hash
>  create mode 100644 package/gflags/gflags.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
