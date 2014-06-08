From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:12:56 +0200
Subject: [Buildroot] [PATCH 0/11 v3] Add list of virtual packages to
 manual (branch yem/manual)
In-Reply-To: <cover.1402236631.git.yann.morin.1998@free.fr>
References: <cover.1402236631.git.yann.morin.1998@free.fr>
Message-ID: <20140608171256.5492d0c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  8 Jun 2014 16:15:13 +0200, Yann E. MORIN wrote:

> This series intends to add the list of virtual packages to the manual, for
> three reasons:
> 
>   - for users that are told (in a comment in the menuconfig) that a
>     package they need depends on a virtual package, to know what provider
>     to select,
> 
>   - for people writing a new provider for an existing virtual package to
>     have a reference of which symbol to select and which package to provide
>     in their Config.in and .mk files,
> 
>   - for people writing a new package that depends on features provided by
>     a virtual package to know what symbol to depend on.
> 
> The series starts with some preparatory changes and cleanups, then
> introduces a way to generate different forms of tables, then goes on by
> removing virtual packages from the current lists, and finally adds a new
> list with the virtual packages.

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
