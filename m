From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Apr 2021 10:38:12 +0200
Subject: [Buildroot] [PATCH 2/3] package/mpfr: bump to version 4.1.0
In-Reply-To: <87czuisvb2.fsf@dell.be.48ers.dk>
References: <20210411094738.455891-1-romain.naour@gmail.com>
 <20210411094738.455891-2-romain.naour@gmail.com>
 <87czuisvb2.fsf@dell.be.48ers.dk>
Message-ID: <2ff41476-363f-2f16-f868-be14ce6dc150@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 25/04/2021 ? 09:00, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > See: https://www.mpfr.org/mpfr-4.1.0/
> 
>  > Update indentation in hash file (two spaces).
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>  > ---
>  > The mpfr mailing is not curently public, I can't get the hash from the announce mail.
> 
>  > https://sympa.inria.fr/sympa/arc/mpfr-announce
> 
>  > At least my hash is the same as the one used for archlinux mpfr package:
> 
>  > https://github.com/archlinux/svntogit-packages/commit/6aa73da19b299ca2a98cf4aa294d53ae0d8084b7
> 
> Are these updated mpfr/mpc versions needed for gcc 10.3? If not, I would
> prefer to not backport them to 2021.02.x.
> 

The mpfr version bump is not required for gcc 10.3 IFAIK.

Best regards,
Romain
