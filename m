From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:14:12 +0200
Subject: [Buildroot] [PATCH] package/gcc: remove legacy leftover for
 PR60102
In-Reply-To: <20170815213304.19335-1-yann.morin.1998@free.fr>
References: <20170815213304.19335-1-yann.morin.1998@free.fr>
Message-ID: <20170816231412.17b429cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 23:33:04 +0200, Yann E. MORIN wrote:
> Commit 2c8de6c4 (gcc 4.9.1: add patch for PR60102) removed the SPE
> condition becasue of said PR, but forgot to remove the associated
> comment, which has been tagging along all this time...
> 
> Remove it, it is no longer valid and causes confusion.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/Config.in.host | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
