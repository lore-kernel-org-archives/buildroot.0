From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 18 May 2021 10:34:50 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: drop
 BR2_PACKAGE_LVM2_APP_LIBRARY
In-Reply-To: <8bce0504-8c29-5868-bd66-c998ece91eae@benettiengineering.com>
References: <20210517170609.810302-1-fontaine.fabrice@gmail.com>
 <20210517170609.810302-2-fontaine.fabrice@gmail.com>
 <20210517204324.GH2506@scaer>
 <CAPi7W83SZL9j2iEvi8DM6EBVJfXksN5-WsGZXnSundeHfYHOYA@mail.gmail.com>
 <8bce0504-8c29-5868-bd66-c998ece91eae@benettiengineering.com>
Message-ID: <46aee4a7-5baf-49b5-889a-aaead48f5501@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/18/21 9:58 AM, Giulio Benetti wrote:
> Hi Fabrice, Adam, All,
> 
> On 5/17/21 10:51 PM, Fabrice Fontaine wrote:
>> Le lun. 17 mai 2021 ? 22:43, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>>>
>>> Fabrice, All,
>>>
>>> +Adam for udisks and GOI... ;-]
>>>
>>> On 2021-05-17 19:06 +0200, Fabrice Fontaine spake thusly:
>>>> The application library (liblvm2app) has been dropped since version
>>>> 2.03.00 and
>>>> https://github.com/lvmteam/lvm2/commit/0d22b58172808f050abeacdb5d6a7b7132b91a8c
>>>>
>>>> It should be noted that lvm2 support must be dropped from udisks until
>>>> a bump to at least version 2.7.0 and
>>>> https://github.com/storaged-project/udisks/commit/4c0709a893be49a0db5b2839e4766621e2c1bb98
>>>>
>>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>
>>> Applied to master, thanks.
>>>
>>> I was a bit concerned that we dropped this support, but hinestly, we
>>> have udisks 1.0.5, from March 2014... So, to me, it's a minor annoyance
>>> if lvm2 support in udisks is dropped...
>>>
>>> IIRC, Adam, did some work on udisks back when he was "toying" with GOI...
>>> Adam? ;-)
>> We also have a patch to bump udisks from Giulio:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20200217143030.5031-5-giulio.benetti at benettiengineering.com/
>> Perhaps, Giulio could also help us to bump udisks.
> 
> I can try to re-bump since at the time I thought there were a lot of
> dependencies while Adam(if I recall correct) told me that GOI wasn't
> needed in libblock for example. So I'm retrying to bump with the minimum
> dependencies. Let's see if I'm able to do this.
> 
> Best regards
> 

Pardon, I've also noticed this Adam's patch to bump that has been rejected:
https://patchwork.ozlabs.org/project/buildroot/patch/20200725230618.3640682-14-aduskett at gmail.com/

But I can't find the reason why it's been rejected. I've applied it and 
it builds after some adjustment without lvm2 for the moment, then I can 
respin it if everything is ok with a second patch re-adding lvm2 support.

-- 
Giulio Benetti
Benetti Engineering sas
