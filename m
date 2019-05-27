From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:14:39 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/sqlite: fix BUG_85180 build
 timeout
In-Reply-To: <6c108457-d8fb-0fb9-4375-8dd07179d400@mind.be>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
 <20190524222459.2fc91773@windsurf.home>
 <6dcdb1eb-5d48-e773-9711-1df461c542e2@micronovasrl.com>
 <3e1c735b-0639-ffaf-9d96-7b51920668fc@micronovasrl.com>
 <20190527113754.48973b30@windsurf>
 <88dab430-b338-8bac-92a2-026777946561@micronovasrl.com>
 <20190527114657.093a6fc8@windsurf>
 <5bd8815c-5183-2e54-da01-f5cf77e730ce@micronovasrl.com>
 <804fa487-03ea-5f5e-7867-6c5b44317585@micronovasrl.com>
 <6c108457-d8fb-0fb9-4375-8dd07179d400@mind.be>
Message-ID: <f66a3b43-0bea-bfd8-fb76-28d728593981@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 27/05/2019 23:11, Arnout Vandecappelle ha scritto:
> 
> 
> On 27/05/2019 20:10, Giulio Benetti wrote:
>> It's a Gcc 4.9 only bug that I need to submit to gcc bugzilla.
> 
>   There's not much point to submit a bug for GCC 4.9, which is no longer
> maintained...

Ah, I didn't know it's maintained anymore.
So in this case I can base the rule for using -O0 on 
BR2_TOOLCHAIN_GCC_AT_LEAST_5 and comment on top of it.
At the moment sqlite is the only package suffering from this.

Thank you
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
