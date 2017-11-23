From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 23 Nov 2017 22:19:50 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: depends also on
 qt5quickcontrols
In-Reply-To: <20171123214546.7e982b20@windsurf.lan>
References: <1510677027-24076-1-git-send-email-giulio.benetti@micronovasrl.com>
 <e8c172b8-f2ec-ced1-dda8-236d0d945b12@micronovasrl.com>
 <20171114165808.akqens5j5obw2n5c@tarshish>
 <32a0057b-1840-ef45-c199-9da6b14ae09c@micronovasrl.com>
 <20171123214546.7e982b20@windsurf.lan>
Message-ID: <7f604fcc-9d2e-bcf7-c38a-43f37de1cae0@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Il 23/11/2017 21:45, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Tue, 14 Nov 2017 18:03:53 +0100, Giulio Benetti wrote:
>> Sorry, my mistake.
>> It installed correctly on STAGING_DIR, but not in TARGET_DIR.
>> This why it compiled fine, but on target it didn't find that
>> libQtQuick.so library.
>> This is a problem on building Qt5 I've noticed.
>>
>> If I build first time Qt5 with few features,
>> than select other more features,
>> those can be built partially and installed partially too.
>>
>> To reproduce you can build qt5base.
>> After that, select qt5cinex,
>> then you should find that libraries are in STAGING_DIR but not in
>> TARGET_DIR.
>>
>> So to have it working properly you have to rm and rebuild qt5base and
>> qt5declarative from beginning.
>>
>> Did someone else noticed this?
> 
> So in the end, is your patch needed ?

No it's not needed, my fault,
sorry.

> 
> Peter (Seiderer), could you review this Qt5 related patch ? Thanks!
> 
> Best regards,
> 
> Thomas
> 


-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
