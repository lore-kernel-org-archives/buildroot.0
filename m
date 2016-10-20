From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 22:04:29 +0200
Subject: [Buildroot] [PATCH] libglib2: fix static linking with libgio
In-Reply-To: <1476813787-9672-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1476813787-9672-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161020220429.228ec132@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 23:33:07 +0530, Rahul Bedarkar wrote:
> When statically linking with libgio, application needs to link with all
> internal libraries that libgio uses. This commit adds patch which
> includes libmount as Libs.private.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/fdf/fdf26abbed0014606a7788ce5d60828a0e871186
>   http://autobuild.buildroot.net/results/1d6/1d69b8ea34cf57255be54de0c87fc83590fb1337
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...o-2.0.pc-include-libmount-in-Libs.private.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch

Applied to master, thanks a lot! Could you please submit the patch
upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
