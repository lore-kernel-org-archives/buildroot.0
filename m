From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:34:53 +0200
Subject: [Buildroot] [PATCH 0/8] fix GCC BUG 71124 and 85862
In-Reply-To: <20190522143148.4f75cd0e@windsurf.home>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
 <20190522143148.4f75cd0e@windsurf.home>
Message-ID: <47b45036-129a-48af-2071-133d34c54f9e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 22/05/2019 14:31, Thomas Petazzoni ha scritto:
> Hello Giulio,
> 
> On Wed, 22 May 2019 14:25:34 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Following 'Fix GCC BUG 85180 per-package' patchset:
>> https://patchwork.ozlabs.org/project/buildroot/list/?series=109024
>> this patchset makes possible to build packages affected by GCC bugs 71124
>> and 85862.
> 
> Is there any evidence that bug 71124 and 85180 are different ?
> 
> When there is an infinite loop when building a package on Microblaze,
> how do you know if it's caused by gcc bug 71124 or gcc bug 85180 ?

Actually not, I only based it on comments present inside Config.in, but 
almost probably they are the same.
Maybe is it better to fuse them into 85180?

Also, do i need to send these for next branch?
Because these patches don't fix bug, they only allow to build packages 
that before were not available.

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
