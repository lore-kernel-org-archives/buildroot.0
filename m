From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:04:34 +0200
Subject: [Buildroot] [PATCH] nodm: uClibc wordexp support is enabled by
 default
In-Reply-To: <20170627190743.GA3908@waldemar-brodkorb.de>
References: <20170627190743.GA3908@waldemar-brodkorb.de>
Message-ID: <20170701100434.549d18ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 21:07:43 +0200, Waldemar Brodkorb wrote:
> Build tested with Qemu X86 sample.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/nodm/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to master, thanks. The minnowboard_max-graphical_defconfig was
using glibc until now, I guess mainly because of the nodm package not
being available with uClibc. Now that nodm is available with uClibc,
perhaps the minnowboard_max-graphical_defconfig can be changed to use
uClibc ?

Ezequiel ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
