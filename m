From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:08:26 +0200
Subject: [Buildroot] [PATCH] package/eudev: fix build with older gcc
In-Reply-To: <1428149398-1552-1-git-send-email-yann.morin.1998@free.fr>
References: <1428149398-1552-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150404150826.604ea481@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  4 Apr 2015 14:09:58 +0200, Yann E. MORIN wrote:
> Initialisers for anonymous unions/structs are unknown to gcc-4.5, still
> widely used.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/11e/11ebb926b891862e270b9cb39fd2ed4344b736a8/
>     http://autobuild.buildroot.org/results/065/065fdef50b1dd57b95ad2b5eda9904a1d0787cdc/
>     http://autobuild.buildroot.org/results/316/3161eb96da66936e2cb3ec6aa5547587c3d90338/
>     http://autobuild.buildroot.org/results/226/2267a204e9eb46bcb621f5bd408deaca98709fc3/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks. At some point we will have to decide to no longer
support gcc 4.5.x. Not sure when we should do that though.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
