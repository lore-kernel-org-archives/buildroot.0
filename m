From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Apr 2015 23:27:59 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: new package
In-Reply-To: <1429689378.3833.19.camel@embedded.rocks>
References: <1429576251-28975-1-git-send-email-joerg.krause@embedded.rocks>	
 <5536C0ED.1080301@mind.be> <1429689378.3833.19.camel@embedded.rocks>
Message-ID: <5538125F.7010509@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg, Arnout, all

Le 22/04/2015 09:56, J?rg Krause a ?crit :
> On Di, 2015-04-21 at 23:28 +0200, Arnout Vandecappelle wrote:
>> On 21/04/15 02:30, J?rg Krause wrote:
>>> This patch is based on an WIP version submitted by Romain Naour, 
>>> commented by
>>> Arnout Vandecappelle:
>>> https://patchwork.ozlabs.org/patch/401270/
>>>
>>> This package provides a default configuration with all external 
>>> dependencies
>>> enabled. This is necessary because upstream does not detect which 
>>> dependencies
>>> are available. Furthermore, upstream does not implement a 
>>> savedefconfig target.
>>>
>>> Note that swupdate provides its own customized version of mongoose 
>>> and
>>> lsqlite3.
>>>
>>> swupdate provides a default website which can be installed to the 
>>> target to
>>> enable firmware update with a browser. This patch adds the user 
>>> option to
>>> install this website.
>>>
>>> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>>> Cc: Romain Naour <romain.naour@openwide.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>> Tested-by: Mike Williams <mike@mikebwilliams.com>
>>> ---

[snip]

>>> diff --git a/package/swupdate/swupdate-0001-Add-missing-header-for
>>> -off_t.patch b/package/swupdate/swupdate-0001-Add-missing-header
>>> -for-off_t.patch
>>> new file mode 100644
>>> index 0000000..4be0f7b
>>> --- /dev/null
>>> +++ b/package/swupdate/swupdate-0001-Add-missing-header-for
>>> -off_t.patch
>>> @@ -0,0 +1,25 @@
>>> +From 4e382373cad64ca7e183336e33b72c53cfeed340 Mon Sep 17 00:00:00 
>>> 2001
>>> +From: Romain Naour <romain.naour@openwide.fr>
>>> +Date: Sun, 7 Sep 2014 17:31:09 +0200
>>> +Subject: [PATCH 1/1] Add missing header for off_t
>>> +
>>> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>
>>  What's the upstream status of this? Stefan is normally pretty 
>> reactive...
> 
> It's not upstream yet. I will send the patch to Stefano.

Sorry, I haven't reworked on swupdate since October :-/
My tests on swupdate with my x86 target are on standby since then.
Also I need to spend some time to add the support for other bootloader than
u-boot (not easy).

I'll try to look at your v4 this week end.

Best regards,
Romain
