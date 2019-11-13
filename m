From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 13 Nov 2019 13:32:46 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <20191113130630.759bf8de@windsurf>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
 <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
 <08d749aa-743d-d05c-7aae-b98e70862617@codethink.co.uk>
 <20191112212446.21cbdbca@windsurf>
 <77353588-bf06-8112-4afe-41f488dbaa66@codethink.co.uk>
 <1debcd70-de93-f709-a313-f358572c3048@smile.fr>
 <20191113130630.759bf8de@windsurf>
Message-ID: <a00e6f2a-69df-00ab-763a-1f0a396e4d5b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 13/11/2019 ? 13:06, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Wed, 13 Nov 2019 12:10:34 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> @Thomas Petazzoni: Maybe we need to rebuild the arm bleeding edge toolchain used
>> by the autobuilders using the current glibc version (2.30).
> 
> True.
> 
>> The current prebuilt toolchain are from 06/2019 but glibc 2.30 has been released
>> 08/2019.
>>
>> There is only one internal toolchain for arm and it use uclibc-ng by default.
>>
>> Maybe we can add a new internal toolchain for glibc and musl ?
> 
> We already have these:
> 
> $ ls -1 support/config-fragments/autobuild/br-arm-internal-*
> support/config-fragments/autobuild/br-arm-internal-full.config
> support/config-fragments/autobuild/br-arm-internal-glibc.config
> support/config-fragments/autobuild/br-arm-internal-musl.config

Ok good, so the list here [1] is outdated.

[1] http://autobuild.buildroot.org/toolchains/configs/

Best regards,
Romain


> 
> Best regards,
> 
> Thomas
> 
