From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 08:56:35 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <50119CC0.5050303@zacarias.com.ar>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
 <20120725203109.5d295941@skate> <20120725211514.1ee35d6a@skate>
 <20120726210102.6f65719c@skate> <50119CC0.5050303@zacarias.com.ar>
Message-ID: <20120727085635.788abcc3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jul 2012 16:38:40 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Looks good in principle.

Ok, thanks.

> A small addition...
> 
> config BR2_x86_pentium_m
>         bool "pentium mobile"
> +	select BR2_X86_CPU_HAS_MMX
> +	select BR2_X86_CPU_HAS_SSE
>         depends on !BR2_x86_64

Ok.

> Also i'd go for a more generic naming for the opterons, i.e. k8,
> k8-sse3, amdfam10 (instead of barcelona) but they're just details that
> can be addressed later with a few additions for newer gcc versions in
> another patch.

Yes, you'll send a patch later for this. My knowledge of the x86
variants is somewhat rusty :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
