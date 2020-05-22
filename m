From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 09:47:36 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: add support for
 XTENSA_[PN]DIFF relocations
In-Reply-To: <20200513123520.30832-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Wed, 13 May 2020 05:35:20 -0700")
References: <20200513123520.30832-1-jcmvbkbc@gmail.com>
Message-ID: <87pnawl8br.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Xtensa have added new relocation types R_XTENSA_[NP]DIFF{8,16,32} with
 > the same properties as the existing types R_XTENSA_DIFF{8,16,32}.
 > Add them to the list of ignored relocation types.

 > This fixes the following error when invoking elf2flt on xtensa binaries
 > built with the recent binutils:

 >   ERROR: reloc type R_XTENSA_PDIFF32 unsupported in this context

 > Reported-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
