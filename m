From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 18:58:11 +0200
Subject: [Buildroot] [PATCH] package/uclibc: enable long double math for
 xtensa
In-Reply-To: <1414234653-18756-1-git-send-email-jcmvbkbc@gmail.com>
References: <1414234653-18756-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20141025185811.62eabdea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sat, 25 Oct 2014 14:57:33 +0400, Max Filippov wrote:
> It fixes the following build failure for packages that expect long
> double support in libm:
> 
>   Linking C executable winpr-hash
>   ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `powl'
>   ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `fmodl'
>   ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `ceill'
>   ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `log10l'
>   ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `floorl'
> 
> Fixes:
>   http://autobuild.buildroot.net/results/323/3236ddfe8eaf89f05f84db60eb42583cca397464/
> 
> Mainline status: patch submitted.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...n.arch-enable-long-double-math-for-xtensa.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
