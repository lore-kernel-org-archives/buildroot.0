From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:30:51 +0100
Subject: [Buildroot] [PATCH 1/6 v3] pacakge/freerdp: disable building
 the manpages
In-Reply-To: <80f81c6f8018e94d43c0a7ed7eec3ea3c50110ee.1417952276.git.yann.morin.1998@free.fr>
References: <cover.1417952276.git.yann.morin.1998@free.fr>
 <80f81c6f8018e94d43c0a7ed7eec3ea3c50110ee.1417952276.git.yann.morin.1998@free.fr>
Message-ID: <20141207213051.25f3d85d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  7 Dec 2014 12:39:27 +0100, Yann E. MORIN wrote:
> Building the manpages requires xsltproc, which might not be available.
> Also, who needs the manpages on the target anyway? ;-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/freerdp/freerdp.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
