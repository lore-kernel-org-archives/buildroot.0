From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:56:39 +0100
Subject: [Buildroot] [PATCH 3/4 v9] pkg-download: silence downloads if
 make is silent
In-Reply-To: <8537faa275be0b3bb0aec3da99d7aaf1c56db17c.1420142462.git.yann.morin.1998@free.fr>
References: <cover.1420142462.git.yann.morin.1998@free.fr>
 <8537faa275be0b3bb0aec3da99d7aaf1c56db17c.1420142462.git.yann.morin.1998@free.fr>
Message-ID: <20150101225639.2890512b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  1 Jan 2015 21:03:52 +0100, Yann E. MORIN wrote:
> From: Fabio Porcedda <fabio.porcedda@gmail.com>
> 
> If it is a silent build (make -s -> QUIET=-q) silence all downloads, as
> well as the check-hash. This is done in two ways:
>   - redirect stdout to /dev/null
>   - pass the -q flag downward to backends

Why do we need to do both?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
