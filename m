From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 10 Apr 2019 14:38:23 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version for
 having msgmerge working
In-Reply-To: <20190410133739.54867aa5@windsurf.home>
References: <20190409174606.31828-1-giulio.benetti@micronovasrl.com>
 <20190410133739.54867aa5@windsurf.home>
Message-ID: <24a6255a-9727-cea2-f07a-f03a02a8a058@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 10/04/2019 13:37, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Tue,  9 Apr 2019 19:46:06 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> On current version msgmerge doesn't work properly. It exits giving:
>> fopen: No such file or directory
>> The problem has been signalled and fixed by upstream.
>>
>> Bump version to latest commit.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Is this fixing a build issue with some particular package ?

This was for package vdr-plugin-vnsiserver that uses msgmerge.
But as you've pointed me here:
https://patchwork.ozlabs.org/patch/1082580/

i18n files are provided when BR2_SYSTEM_ENABLE_NLS=y
So I think it's useless.

Right?

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
