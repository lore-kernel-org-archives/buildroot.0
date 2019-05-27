From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 22:34:25 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/ecryptfs-utils: allow
 building with GCC_BUG_85862 and on Microblaze
In-Reply-To: <20190527211329.18c6678c@windsurf>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-6-giulio.benetti@micronovasrl.com>
 <77c2dccf-73ae-a78f-c0d8-28842e103440@micronovasrl.com>
 <20190527211329.18c6678c@windsurf>
Message-ID: <e73ea003-a4ab-82d5-320b-956b126d2f3a@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 27/05/2019 21:13, Thomas Petazzoni ha scritto:
> On Mon, 27 May 2019 19:28:32 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> I've seen you've tagged this as Changes Requested:
>> https://patchwork.ozlabs.org/patch/1103358/
>>
>> It is because of dependency to "keyutils" still not fixed right?
> 
> Because this patch depends on the libnss patch, which was also marked
> as Changes Requested.

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
