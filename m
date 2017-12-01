From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:00:20 +0100
Subject: [Buildroot] [PATCH 7/8] package/asterisk: add comment about a
 check-package false positive
In-Reply-To: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201230020.6c06eb9a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:44 +0100, Yann E. MORIN wrote:
> This variable is inherited from the target variant, which is
> autoreconfed. But the host variant is only the menucselect
> sub-directory, which we do not want to autoreconf, so the explcit
> NO is required.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/asterisk/asterisk.mk | 1 +
>  1 file changed, 1 insertion(+)

As we discussed, I marked this one as Rejected in patchwork. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
