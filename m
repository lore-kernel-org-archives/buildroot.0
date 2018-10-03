From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 3 Oct 2018 14:57:48 +0200
Subject: [Buildroot] [PATCH] linux-firmware: fix build failure on
 legal-info
In-Reply-To: <20181003044542.hrqjjfbxoic56hpb@sapphire.tkos.co.il>
References: <20181002214318.85312-1-giulio.benetti@micronovasrl.com>
 <20181003044542.hrqjjfbxoic56hpb@sapphire.tkos.co.il>
Message-ID: <1581a80e-7753-b756-46c7-fd8c5d37cbb4@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Il 03/10/2018 06:45, Baruch Siach ha scritto:
> Hi Giulio,
> 
> On Tue, Oct 02, 2018 at 11:43:18PM +0200, Giulio Benetti wrote:
>> In linux-firmware.hash WHENCE sha256 is wrong causing make legal-info to
>> fail.
> 
> Do WHENCE file changes affect the license of any firmware file? Please mention
> in the commit log.

And this is the third time I've forgotten about it in commit log.

Thank you for reviewing.
Going to send V2

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
