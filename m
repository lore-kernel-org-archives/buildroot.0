From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 May 2019 10:58:15 +0200
Subject: [Buildroot] [PATCH v2 7/7] package/flashbench: remove old check
 if BR2_microblaze & BR2_sh2a
In-Reply-To: <20190524231859.380b11f3@windsurf>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-8-giulio.benetti@micronovasrl.com>
 <20190524231859.380b11f3@windsurf>
Message-ID: <ba8dfba9-e3e6-d93d-172f-31db3eafc2fe@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 24/05/2019 23:18, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed, 22 May 2019 15:59:06 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Commit:
>> https://git.buildroot.net/buildroot/commit/?id=bad25aff36b70b55b34ea4580b45f657385ae9ac
>> removed sourcery toolchain already deprecated in 2014 causing build
>> failure. It was based on Gcc 4.6.2 and Buildroot doesn't use this
>> anymore.
> 
> This explanation is quite fuzzy. What is the relationship between the
> removal of those toolchains and this particular issue ? 

I improve commit log.

>Also this commit only removes Microblaze toolchains, not SH2A toolchains.

I've messed up, I need to remove BR2_microblaze only.

> Since when the LLONG_MAX issue has been fixed ?

Need to check and report on commit log.

Best regards
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

> Best regards,
> 
> Thomas
> 
