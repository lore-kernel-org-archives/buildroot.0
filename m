From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 21:26:28 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160707170024.GB3827@free.fr>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
 <20160706202005.6e2ac6c3@free-electrons.com>
 <20160707170024.GB3827@free.fr>
Message-ID: <20160707212628.3df1cef5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 19:00:24 +0200, Yann E. MORIN wrote:

> But then we would probably have to do it for other packages that build
> both a kernel module and userland stuff, no?
> 
> I'm not sure I like that... :-/
> 
> I think the best option would be to break at the linux-tools.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
