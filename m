From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 8 Nov 2017 13:03:51 -0700
Subject: [Buildroot] [PATCH v2 1/2] qt5 add qmake.conf.in for eglfs
In-Reply-To: <2AD72CC1-4D0B-471E-A176-9FF8962712B4@micronovasrl.com>
References: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
 <52578484-a127-0727-e677-49c17058cc17@microchip.com>
 <2AD72CC1-4D0B-471E-A176-9FF8962712B4@micronovasrl.com>
Message-ID: <7301ce99-9286-bed2-380c-aef3bf66c1aa@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio,

On 11/08/2017 11:52 AM, Giulio Benetti wrote:
> Hi,
> 
>> Il giorno 08 nov 2017, alle ore 19:42, Joshua Henderson <joshua.henderson@microchip.com> ha scritto:
>>
>> Giulio,
>>
>>> On 11/08/2017 11:21 AM, Giulio Benetti wrote:
>>> EGLFS_DEVICE_INTEGRATION = eglfs_* doesn't work correctly with previous patch
>>> EGLFS_DEVICE_INTEGRATION = eglfs_viv/eglfs_* must be written before include(../common/linux_device_post.conf)
>>>
>>> Starting from qmake.conf.in, 
>>> generate qmake.conf substituting @EGLFS_DEVICE@ with eglfs_viv or eglfs_mali
>>> according to Package selection
>>>
>>
>> ---
>>
>> Tip: In the future, put 3 dashes right here so the revision notes, and any notes
>> in general you want to include in the email, are not included in the final
>> commit log. You can apply the generated email yourself to a clean tree and see
>> that anything below the 3 dashes is dropped.
> 
> Ok, I didn?t know about that.
> Thank you very much!
> 

You might want to look into git notes and git format-patch --notes to automate it and
keep notes separate.  Maybe wait a bit before submitting a new patch just for this
right now, unless requested.

Josh
