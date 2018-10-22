From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 22 Oct 2018 23:09:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-21
In-Reply-To: <20181022060034.EFADF20DCD@mail.bootlin.com>
References: <20181022060034.EFADF20DCD@mail.bootlin.com>
Message-ID: <6d6eb92f-2bdd-c418-6356-a8d8b499c684@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 22/10/2018 08:00, Thomas Petazzoni ha scritto:
> Hello,
> 
> Build statistics for 2018-10-21
> ===============================
> 
>        branch |  OK | NOK | TIM | TOT |
>     2018.02.x |  24 |   2 |   0 |  26 |
>     2018.08.x |  22 |   1 |   0 |  23 |
>        master | 216 |  20 |   0 | 236 |
> 
> Results for branch '2018.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                     attr-2.4.48 | 1
>                ptpd2-ptpd-2.3.1 | 1

This and..

> 
> Detail of failures
> ------------------
> 
>          bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/0809e6db9ca8e2b77a15046f5726cfe46130f0f5 |
>      mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/12471bcafed9a4a1f6165e16f87dae09e372bc63 | ORPH
> 
> Results for branch '2018.08.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                ptpd2-ptpd-2.3.1 | 1

this are solved by these 2 patches:
https://git.buildroot.net/buildroot/commit/?id=5b7bc560a5859d4b9f0c2a14c10e83c18fbd6bca
https://git.buildroot.net/buildroot/commit/?id=d60973af00c5ad7dc15049597cf03bd1ad538041

Kind regards
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
