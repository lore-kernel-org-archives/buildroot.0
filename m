From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:56:02 +0200
Subject: [Buildroot] [PATCH 1/2] qemu/x86: update defconfig to Linux
 3.15.x
In-Reply-To: <20140730134316.GA7179@waldemar-brodkorb.de>
References: <20140730134316.GA7179@waldemar-brodkorb.de>
Message-ID: <20140731235602.64ae2f2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 30 Jul 2014 15:43:17 +0200, Waldemar Brodkorb wrote:
> Update the default configuration to use Linux 3.15.x.
> Enable ext4, so that ext2/ext3/ext4 can be used.
> Tested with Qemu 2.0.0.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/x86/{linux-3.13.config => linux-3.15.config} |  2 +-
>  board/qemu/x86/readme.txt                               |  2 +-
>  configs/qemu_x86_defconfig                              | 10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename board/qemu/x86/{linux-3.13.config => linux-3.15.config} (99%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
