From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 00:11:09 +0200
Subject: [Buildroot] [PATCH 05/11] package/ktap: use kernel-module helper
In-Reply-To: <20150608213413.GE3590@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <b83c94f8a4484928bd45a9b4ed55c6c7d9f2751c.1433628825.git.yann.morin.1998@free.fr>
 <20150608232559.743f42e6@free-electrons.com>
 <20150608213131.GD3590@free.fr> <20150608213413.GE3590@free.fr>
Message-ID: <20150609001109.03b08f87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 8 Jun 2015 23:34:13 +0200, Yann E. MORIN wrote:

> Sorry, I sent too early, forgot to say:
> 
> KERNEL_SRC is used i ktap's Makefile only to run commands like:
> 
>     $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
> 
> So, since that's our infra now doing that, KERNEL_SRC is no longer
> needed.

Ok, makes sense. Might be worth mentioning in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
