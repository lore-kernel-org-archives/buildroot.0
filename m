From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 21:59:46 +0200
Subject: [Buildroot] [PATCH v2 2/2] e2fsprogs: fix build failure with
 old glibc versions
In-Reply-To: <1465481593-2614-2-git-send-email-gustavo@zacarias.com.ar>
References: <1465481593-2614-1-git-send-email-gustavo@zacarias.com.ar>
 <1465481593-2614-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160609215946.6263af25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 11:13:13 -0300, Gustavo Zacarias wrote:
> In old (< 2.17) glibc versions clock_gettime() resides in librt, however
> there's no check for this, so add a patch to fix it. Fixes:
> http://autobuild.buildroot.net/results/25c/25c042d2862affebf552ed24bc2a58e0c484226f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> Changes for v2: host-gettext is also required for host-e2fsprogs

Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
