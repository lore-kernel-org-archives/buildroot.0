From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:13:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/acpid: fix musl build problem
In-Reply-To: <1438100242-11161-1-git-send-email-brendanheading@gmail.com>
References: <1438100242-11161-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150728231316.695053bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Tue, 28 Jul 2015 17:17:22 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/7e6/7e60af535dd4177afdc4cb7b92e9abf27c3fba07
> 
> acpid uses TEMP_FAILURE_RETRY which is a glibc feature.
> patch adds this macro if it is not present and __GLIBC__
> is undefined.
> 
> Patch submitted upstream.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  .../acpid/0003-support-for-non-glibc-libcs.patch   | 184 +++++++++++++++++++++
>  1 file changed, 184 insertions(+)
>  create mode 100644 package/acpid/0003-support-for-non-glibc-libcs.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
