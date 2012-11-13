From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 22:18:43 +0100
Subject: [Buildroot] [PATCH v2 3/6] Add board files for snowball
In-Reply-To: <50A228F9.20605@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-4-git-send-email-gregory.hermant@calao-systems.com>
 <20121112193716.54622654@skate> <50A228F9.20605@calao-systems.com>
Message-ID: <50A2B933.4010607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 12:03, Gr?gory Hermant wrote:
> Le 12/11/2012 19:37, Thomas Petazzoni a ?crit :
>> Dear Gregory Hermant,
>>
>> On Mon, 12 Nov 2012 18:41:39 +0100, Gregory Hermant wrote:
>>>
>>> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
>>> ---
>>>   board/calao/snowball/busybox-1.20.x.config | 1024 ++++++++++++++++++++++++++++
>>
>> Is there a specific reason to have a custom Busybox configuration file?
>
> Enable the firmware loading (mdev).

  As I wrote last Friday, that is (or should be) enabled automatically when you
select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, which you do in patch 6/6.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
