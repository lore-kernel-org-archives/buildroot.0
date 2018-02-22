From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 22 Feb 2018 09:52:31 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: set parallel
 build according to buildroot
In-Reply-To: <87zi42hv5m.fsf@dell.be.48ers.dk>
References: <1519129328-98231-1-git-send-email-giulio.benetti@micronovasrl.com>
 <87zi42hv5m.fsf@dell.be.48ers.dk>
Message-ID: <bbf4a9d3-684f-a093-c867-257b8cec7820@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you,

I've also noticed that I sould tag patch as [for-next] for next patches.

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

Il 21/02/2018 22:47, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
>   > sunxi-mali-mainline-driver builds using parallel compilation by default,
>   > using -j $(nproc), but this could be not wanted.
> 
>   > Pass -j $(PARALLEL_JOBS) to build using jobs configured in buildroot.
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Committed to next, thanks.
> 
