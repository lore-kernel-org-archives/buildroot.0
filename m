From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:44:12 +0200
Subject: [Buildroot] [PATCH v2] arch/Config.in.xtensa: provide
 BR2_ENDIAN symbol
In-Reply-To: <1430842704-28771-1-git-send-email-jcmvbkbc@gmail.com>
References: <1430842704-28771-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150505224412.451cab4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue,  5 May 2015 19:18:24 +0300, Max Filippov wrote:
> Packages get hints from the buildroot at configure time, e.g.
> ac_cv_c_bigendian=yes/no. This particular hint is based on the value of
> BR2_ENDIAN and when it doesn't match actual toolchain endiannes the
> build may break.
> Provide BR2_ENDIAN for xtensa to fix this sort of build errors.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/31115fe8d88f52d77ed0f2da769eb8896a1b34a2/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Changes v1->v2:
> - add spaces between configure items;
> - expand changelog.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
