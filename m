From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:56:43 +0200
Subject: [Buildroot] [PATCH 2/2] qemu/x86: add defconfig for serial
 console usage
In-Reply-To: <20140730134403.GA11974@waldemar-brodkorb.de>
References: <20140730134403.GA11974@waldemar-brodkorb.de>
Message-ID: <20140731235643.36e406c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 30 Jul 2014 15:44:11 +0200, Waldemar Brodkorb wrote:
> Developers sometimes work remotely and want to test stuff in Qemu
> without having X11 running. For this case an extra defconfig is
> useful and does not break existing defconfig.
> 
> A config which can be used for both cases might be used instead,
> but I see no option to add more gettys via the existing buildroot
> variables.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/x86/readme.txt         |  6 ++++++
>  configs/qemu_x86_serial_defconfig | 23 +++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 configs/qemu_x86_serial_defconfig

Since there are still comments about this approach, and a suggestion to
do it differently, I've marked this patch as "Changes Requested" in our
patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
