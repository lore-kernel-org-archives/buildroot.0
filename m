From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:12:59 +0200
Subject: [Buildroot] [PATCH] ARC: switch to RC1 of upcoming arc-2015.06
 tools
In-Reply-To: <1435346840-9677-1-git-send-email-abrodkin@synopsys.com>
References: <1435346840-9677-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150628151259.7ceae2a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Fri, 26 Jun 2015 22:27:20 +0300, Alexey Brodkin wrote:
> Even though this is only RC1 it's been heavily used internally so it should
> not be any worse than existing arc-2014.12.
> 
> Moreover this relase (and so its RC1) finally delivers support of NPTL
> for ARC in uClibc.
> 
> That's why it would be good to allow interested users to start trying it
> (for example WebKit and apps that use WebKit could be successfully built
> and run) also it will be helpful to run that new toolchain through
> autobuilder in attempt to find any hidden regressions so we have a solid
> toolchain for release.
> 
> If there's an interest in that patch more patches will follow with
> subsequent RCs and essentially on appearence or relese Buildroot will be
> updated with it.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  package/binutils/Config.in.host | 2 +-
>  package/binutils/binutils.hash  | 2 +-
>  package/gcc/Config.in.host      | 2 +-
>  package/gcc/gcc.hash            | 2 +-
>  package/gdb/Config.in.host      | 2 +-
>  package/gdb/gdb.hash            | 2 +-
>  package/uclibc/Config.in        | 5 +++--
>  package/uclibc/uclibc.hash      | 2 +-
>  8 files changed, 10 insertions(+), 9 deletions(-)

Applied, thanks. I've also committed a patch that makes the ARC uClibc
version the default version on ARC.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
