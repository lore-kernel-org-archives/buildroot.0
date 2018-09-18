From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Sep 2018 20:06:04 +0200
Subject: [Buildroot] Newbie question: BR2_... vs !BR2_...
In-Reply-To: <CO2PR01MB19769AB1B99D4697112C4F76CC1D0@CO2PR01MB1976.prod.exchangelabs.com>
References: <CO2PR01MB19769AB1B99D4697112C4F76CC1D0@CO2PR01MB1976.prod.exchangelabs.com>
Message-ID: <ea10803a-f057-a00e-60f4-d2bc312fff9d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 18/09/2018 20:01, Enoch W. ha scritto:
> Hi,
> 
> What is the reason for some Buildroot Config.in variables having an 
> exclamation mark prefix, !BR2_... , but most don't.

It means *not* BR2_...
Like:
config BR2_PACKAGE_FOO
	depends on !BR2_USE_MMU

It means that package FOO can't be selected if BR2_USE_MMU=y

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
