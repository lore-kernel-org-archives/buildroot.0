From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 15:24:30 +0200
Subject: [Buildroot] [PATCH 24/24 v4] arch: remove no-longer default on
 atomics option
In-Reply-To: <b21be02c-7494-4873-aa25-44b3061aed94@email.android.com>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
 <b8d37160ad1e6fafbba18de4733512650e00f6ec.1408279142.git.yann.morin.1998@free.fr>
 <b21be02c-7494-4873-aa25-44b3061aed94@email.android.com>
Message-ID: <20140817132430.GF5274@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-17 15:03 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >Now that all archiotectures explicitly select this options when it makes
> 
> architectures
> option

Fixed, thanks.

Regards,
Yann E. MORIN.

> >sense, there is no need to have a default value.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
> >---
> > arch/Config.in | 1 -
> > 1 file changed, 1 deletion(-)
> >
> >diff --git a/arch/Config.in b/arch/Config.in
> >index 6bcafd4..1126d43 100644
> >--- a/arch/Config.in
> >+++ b/arch/Config.in
> >@@ -253,7 +253,6 @@ config BR2_GCC_TARGET_MODE
> > # If the architecture has atomic operations, select this:
> > config BR2_ARCH_HAS_ATOMICS
> > 	bool
> >-	default y if !BR2_arc
> > 
> > # Set up target binary format
> > choice
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
