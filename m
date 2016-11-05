From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:36:00 +0100
Subject: [Buildroot] [PATCH] binutils: add upstream patch to fix open
 microblaze issue
In-Reply-To: <20161105154219.GA6142@waldemar-brodkorb.de>
References: <20161105154219.GA6142@waldemar-brodkorb.de>
Message-ID: <20161105233600.22cddfbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Nov 2016 16:42:19 +0100, Waldemar Brodkorb wrote:
> This reenables the use of 2.27 for microblaze.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...-Set-dynamic-tag-VMA-and-size-from-dynami.patch | 36 ++++++++++++++++++++++
>  package/binutils/Config.in.host                    |  3 --
>  2 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
