From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:48:43 +0200
Subject: [Buildroot] [PATCH v3 1/2] axfsutils: add new package
In-Reply-To: <1444852286-12219-2-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444852286-12219-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444852286-12219-2-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <20151014234843.0eee5e1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ariel D'Alessandro,

On Wed, 14 Oct 2015 16:51:25 -0300, Ariel D'Alessandro wrote:
> Tools for building AXFS Filesystem.
> 
> The Advanced XIP File System is a Linux kernel filesystem driver that
> enables files to be executed directly from flash or ROM memory rather
> than being copied into RAM. It has the ability to store individual
> *pages* in a file uncompressed/XIP or compressed/Demand Paged.
> 
> Source:
> 	https://github.com/jaredeh/axfs
> 
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  package/axfsutils/axfsutils.mk | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/axfsutils/axfsutils.mk

Applied with some minor tweaks:

    [Thomas:
     - add hash file.
     - use $(INSTALL) -D -m 0755 instead of cp for installing mkfs.axfs.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
