From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:38:29 +0100
Subject: [Buildroot] [PATCH 1/3] core/pkg-autotools: align host
 configure commands to target one
In-Reply-To: <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
Message-ID: <20151123183829.077c602c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Nov 2015 15:39:41 +0100, Yann E. MORIN wrote:
> The host configure commands are not indented the same way as the target
> ones. Besides, there are leading spaces (instead of TABs) on one line.
> 
> Replicate the same indentation as used for the target commands.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-autotools.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
