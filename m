From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 13 Sep 2018 08:56:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump version
In-Reply-To: <bubp6fxp95.ln2@ID-313208.user.individual.net>
References: <20180911205613.24701-1-bernd.kuhls@t-online.de>
 <20180912163344.532b37ab@windsurf>
 <bubp6fxp95.ln2@ID-313208.user.individual.net>
Message-ID: <d3364deb-93ad-c152-4155-3680a7fc1e48@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 13/09/2018 08:16, Bernd Kuhls ha scritto:
> Am Wed, 12 Sep 2018 16:33:44 +0200 schrieb Thomas Petazzoni:
> 
>> Hello,
>>
>> On Tue, 11 Sep 2018 22:56:13 +0200, Bernd Kuhls wrote:
>>
>>> -LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
>>> +LIBSSH2_VERSION = 8b870ad771cbd9cd29edbb3dbb0878e950f868ab
>>
>> Looks like this new version has issues:
>>
>>    http://autobuild.buildroot.net/?
> reason=libssh2-8b870ad771cbd9cd29edbb3dbb0878e950f868ab
>>
>> Thomas
> 
> Hi Thomas,
> 
> tried both defconfigs from Sep, 12th, both build without issues. I can
> not reproduce the problem here (Debian buster), sorry.

I can reproduce, gonna try to fix this.

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
