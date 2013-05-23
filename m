From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 23 May 2013 22:27:54 +0100
Subject: [Buildroot] [PATCH] jamvm: Restrict MIPS BE and MIPS64 cores
In-Reply-To: <87d2shieax.fsf@dell.be.48ers.dk>
References: <1369142945-15964-1-git-send-email-markos.chandras@gmail.com>
 <87d2shieax.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8hqbB0xZZ1PULkwANPEKKuSfHagzoYZpYdTxdQTB-nFkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 May 2013 22:20, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
>  Markos> From: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> The configure.ac script is only looking for mipsel-*-linux so restrict
>  Markos> unsupported MIPS cores.
>
>  Markos> Fixes the following problem:
>
>  Markos> configure: error: mips-buildroot-linux-uclibc not supported
>
> A quick look at configure.ac seems to show that it only supports:
>
> arm, armeb, i386, mipsel, powerpc and x86-64.
>
> Care to send a patch making it depend on those archs instead?
>

Hi Peter,

Yes I will send a new patch.


--
Regards,
Markos Chandras
