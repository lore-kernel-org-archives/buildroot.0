From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:27:13 +0200
Subject: [Buildroot] [PATCH] uclibc: powerpc: fix PIE/PIC builds with
 secureplt enabled by default
In-Reply-To: <20210601191616.153644-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 1 Jun 2021 21:16:16 +0200")
References: <20210601191616.153644-1-romain.naour@gmail.com>
Message-ID: <87zgvyktum.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Apply the fix provided by Yann Sionneau when secureplt is enabled
 > by default by gcc compiler along with PIE/PIC options.

 > "For the secure PLT to work in PIC, the r30 register needs to point to the GOT"

 > Fixes:
 > [qemu_ppc_e500mc_defconfig] https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661606
 > [qemu_ppc_g3beige_defconfig] https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661607
 > [qemu_ppc_mac99_defconfig] https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661609

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yann Sionneau <yann@sionneau.net>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
