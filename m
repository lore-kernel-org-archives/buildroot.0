From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Mar 2013 00:33:16 +0100
Subject: [Buildroot] [PATCH 09/14] Added package foomatic-filters
In-Reply-To: <20130325000420.005eaf04@skate>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
 <d3c3ed22f4740cdb98c47b8650314cfc86468650.1364165310.git.yann.morin.1998@free.fr>
 <20130325000420.005eaf04@skate>
Message-ID: <201303250033.16280.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 25 March 2013 Thomas Petazzoni wrote:
> On Sun, 24 Mar 2013 23:50:44 +0100, Yann E. MORIN wrote:
> 
> > +	select BR2_PACKAGE_LIBUSB
> 
> 	# libusb dependency
> 	depends on BR2_TOOLCHAIN_HAS_THREADS

Right-o-right. Fixed here, and pushed in my branch.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
