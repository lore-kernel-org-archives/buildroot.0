From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 13:25:49 +0100
Subject: [Buildroot] crosstools build fails when hard fpu is selected
In-Reply-To: <50ACAB98.90607@wanadoo.fr>
References: <50ACAB98.90607@wanadoo.fr>
Message-ID: <20121121132549.7c180f2f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Wed, 21 Nov 2012 11:23:20 +0100, Thierry Bultel wrote:

> GCC has not been generated with the harware FPU support.
> 
> I have attempted several hacks into
> toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
> 
> ... with no better success
> 
> Any ideas ?

Yes, raise this problem on the crosstool-ng mailing list. I know Yann
is aware of this, and he will most likely have recommendations on how
to fix this problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
