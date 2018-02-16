From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 16 Feb 2018 13:34:28 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
In-Reply-To: <87efllktnd.fsf@dell.be.48ers.dk>
References: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
 <87lgfum0aq.fsf@dell.be.48ers.dk>
 <6f81dc33-b3a2-223e-1628-aed8a2e1e747@micronovasrl.com>
 <87vaexlxld.fsf@dell.be.48ers.dk>
 <979834e4-a338-525b-c7fd-1241c72127fb@micronovasrl.com>
 <87mv09lw85.fsf@dell.be.48ers.dk>
 <59e456bb-cc6d-d209-0853-c53a8eec7a85@micronovasrl.com>
 <87efllktnd.fsf@dell.be.48ers.dk>
Message-ID: <c37e0130-0e66-b53d-a3c9-0b3cf58a52c0@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 16/02/2018 13:26, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
> Hi,
> 
>   >> No, I'm NOT using quilt. quilt is not a required dependency for
>   >> Buildroot (and we don't have a host-quilt package), so I'm tweaking
>   >> build.sh to use our apply-patches.sh script like we use to apply our
>   >> patches instead of quilt.
> 
>   > Would it make sense to add host-quilt package?
> 
> Well, we could - But as it is fairly simple to patch build.sh to use
> apply-patches.sh and no other packages currently needs it I decided not
> to do so yet.

Ok, thanks.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

> 
