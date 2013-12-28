From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 16:26:42 +0100
Subject: [Buildroot] [PATCH 1/4] graph-build-time: generate graphs based
 on timing data
In-Reply-To: <ea00abe7d4b0119c4614f581bc26d0655ea3c576.1388185918.git.yann.morin.1998@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <ea00abe7d4b0119c4614f581bc26d0655ea3c576.1388185918.git.yann.morin.1998@free.fr>
Message-ID: <20131228162642.1ce399d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 00:12:49 +0100, Yann E. MORIN wrote:

> Example usage:
> 
>   cat $(O)/build-time.log | \
>       ./support/scripts/graph-build-time \
>       --type=histogram --output=foobar.pdf

I'm wondering: since the script has a --output/-o option, would it make
more sense to have a --input/-i option instead of passing the
build-time.log contents on the standard input?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
