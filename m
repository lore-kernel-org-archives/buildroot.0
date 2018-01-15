From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Jan 2018 22:38:10 +0100
Subject: [Buildroot] [PATCH v2] package/ti-cgt-pru: bump to 2.2.1
In-Reply-To: <87bmhuuass.fsf@dell.be.48ers.dk>
References: <20180109201306.13526-1-romain.naour@gmail.com>
 <87bmhuuass.fsf@dell.be.48ers.dk>
Message-ID: <8f95e1aa-b379-1873-8889-f3c728695e48@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 15/01/2018 ? 21:28, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > See: http://www.ti.com/tool/download/PRU-CGT-2-2
>  > The ti-cgt-pru v2.1.x installer are affected by a bug with recent
>  > distribution (Fedora 27 and Ubuntu 17.10) using kernel 4.13 or 4.14
>  > with a glibc 2.26.
>  > The installer is stuck in a futex(wait) system call.
> 
>  > While at it, add license hash.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/68f/68f60ad38d9b6eae83b5d233966616a25d8c9391
> 
> 2017.02.x is using 2.1.3. Can you confirm that this version is also
> affected by the issue?
> 

I confirm and it's the same for 2017.11.x. As soon as a recent Linux distro is
used with the ti-cgt-pru installer it hang.

Best regards,
Romain
