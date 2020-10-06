From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 6 Oct 2020 22:36:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version
 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
In-Reply-To: <87mu12s4rz.fsf@dell.be.48ers.dk>
References: <20201002155931.1529915-1-romain.naour@gmail.com>
 <20201002155931.1529915-2-romain.naour@gmail.com>
 <87mu12s4rz.fsf@dell.be.48ers.dk>
Message-ID: <def26807-e0af-5a4a-787d-a3ec2807cc21@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 04/10/2020 ? 11:45, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > - Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been added.
>  >   Remove the ARC specific version.
> 
>  > - Remove --enable-obsolete-rpc configure option.
> 
>  > Security related changes:
> 
>  >   CVE-2016-10228: An infinite loop has been fixed in the iconv program when
>  >   invoked with the -c option and when processing invalid multi-byte input
>  >   sequences.  Reported by Jan Engelhardt.
> 
>  >   CVE-2020-10029: Trigonometric functions on x86 targets suffered from stack
>  >   corruption when they were passed a pseudo-zero argument.  Reported by Guido
>  >   Vranken / ForAllSecure Mayhem.
> 
>  >   CVE-2020-1752: A use-after-free vulnerability in the glob function when
>  >   expanding ~user has been fixed.
> 
>  >   CVE-2020-6096: A signed comparison vulnerability in the ARMv7 memcpy and
>  >   memmove functions has been fixed.  Discovered by Jason Royes and Samual
>  >   Dytrych of the Cisco Security Assessment and Penetration Team (See
>  >   TALOS-2020-1019).
> 
> These security fixes were already in 2.31.1, E.G. what we are currently
> using, right?
> 

Indeed, they has been added to glibc 2.32 and backported to stable branches.
It's just a copy from the release announcement... we can drop it if you prefer.

Best regards,
Romain
