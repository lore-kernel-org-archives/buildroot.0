From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:16:17 +0200
Subject: [Buildroot] [PATCH 1/2] strace: fix program_invocation_name
 uClibc declaration mismatch
In-Reply-To: <8423660704daf069a26cafd6fd43009796262e33.1504862629.git.baruch@tkos.co.il>
References: <8423660704daf069a26cafd6fd43009796262e33.1504862629.git.baruch@tkos.co.il>
Message-ID: <20170909221617.706e6053@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Sep 2017 12:23:48 +0300, Baruch Siach wrote:
> The local program_invocation_name declaration conflicts with the uClibc
> one. Add a patch making this declaration depend on
> !HAVE_PROGRAM_INVOCATION_NAME.
> 
> Fixes:
> http://autobuild.buildroot.net/results/5f0/5f0852f3ffb46f8fb2b4c9318652c5ab3ab5e97d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...s-fix-program_invocation_name-type-confli.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch

Applied to master, thanks. I've updated the upstream status in the
patch, since it has been merged upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
