From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 15:15:41 +0200
Subject: [Buildroot] [PATCH 0/8] fix GCC BUG 71124 and 85862
In-Reply-To: <20190522150244.621f9be7@windsurf.home>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
 <20190522143148.4f75cd0e@windsurf.home>
 <47b45036-129a-48af-2071-133d34c54f9e@micronovasrl.com>
 <20190522150244.621f9be7@windsurf.home>
Message-ID: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 22/05/2019 15:02, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed, 22 May 2019 14:34:53 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>> When there is an infinite loop when building a package on Microblaze,
>>> how do you know if it's caused by gcc bug 71124 or gcc bug 85180 ?
>>
>> Actually not, I only based it on comments present inside Config.in, but
>> almost probably they are the same.
>> Maybe is it better to fuse them into 85180?
> 
> I would suggest so, and perhaps we can mark 71124 as a duplicate of
> 85180 on the gcc bug tracker as well.

Ok, I'm going to mark as duplicate on gcc bug tracker and fuse 71124 
into 85180.

>> Also, do i need to send these for next branch?
> 
> As said on IRC: just base your patches in master. I think it's material
> from master, and if Peter/Arnout disagree, we will apply on next: there
> won't be much conflicts anyway, and if there's any, it will be a
> trivial conflict.

Ok.

Thank you!

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

> Best regards,
> 
> Thomas
> 
