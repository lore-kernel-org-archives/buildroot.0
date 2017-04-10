From: Kevin JOLY <kevin.joly@sensefly.com>
Date: Mon, 10 Apr 2017 11:24:32 +0200
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <d0b4e258-3c24-2691-3d93-03c4f1a936e8@gmail.com>
References: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
 <20170406223644.473ebd65@free-electrons.com>
 <cd88fd7c-dceb-cef1-59de-e086c6b3df00@sensefly.com>
 <d0b4e258-3c24-2691-3d93-03c4f1a936e8@gmail.com>
Message-ID: <33dd1db4-d5cb-3f49-931d-613dd6967b7d@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, Thomas,


Le 07. 04. 17 ? 22:52, Romain Naour a ?crit :
> Hi Kevin, Thomas,
>
> Le 07/04/2017 ? 07:14, Kevin JOLY a ?crit :
>> Hello Thomas,
>>
>> I was talking with Romain on this mailing list and he had concern about license
>> and dependencies of libgphoto2. I contacted the developpers of libgphoto2 to
>> ensure that the license type was correct. I also turned the libexif, jpeg and gd
>> dependencies as optional.
>>
>> Anyway, if the patch is in the pipe, everything is fine. I re-submitted it
>> because I didn't saw it was already on patchwork but I didn't wanted to be
>> redundant with it.
> Indeed, I've posted a patch adding libgphoto2 in Buildroot some day before your
> initial submission [1], but it's ok since you're working on it.
>
> It would be great if you add a small changlog between each iteration, see [2]
> (21.5.4. Patch revision changelog). That's why Thomas asked what changed in your
> last submission.
Ok, I submitted the v2 right before this email. Sorry about that, I'm 
still a newbie in patch revision!
>
> Also, can you check this new package with the new test-pkg script ? [3]
> (17.20.2. How to test your package).
I ran the test. Everything was OK except br-arm-cortex-m4-full and 
br-arm-full-nothread.
>
> I'll review it later this week-end.
> I'll mark my initial patch superseded in the patchwork.
>
> Best regards,
> Romain
>
> [1] http://patchwork.ozlabs.org/patch/735448/
> [2] http://nightly.buildroot.org/manual.html#submitting-patches
> [3] http://nightly.buildroot.org/manual.html#_tips_and_tricks
>> Thank you
>>
>> Kevin JOLY
>>
>> Le 06. 04. 17 ? 22:36, Thomas Petazzoni a ?crit :
>>> Hello,
>>>
>>> On Thu, 6 Apr 2017 10:33:12 +0200, Kevin JOLY wrote:
>>>> Add support for libgphoto2 core library designed to allow access to digital camera.
>>>>
>>>> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
>>>> ---
>>>>   DEVELOPERS                         |  3 +++
>>>>   package/Config.in                  |  1 +
>>>>   package/libgphoto2/Config.in       | 11 +++++++++++
>>>>   package/libgphoto2/libgphoto2.hash |  6 ++++++
>>>>   package/libgphoto2/libgphoto2.mk   | 29 +++++++++++++++++++++++++++++
>>>>   5 files changed, 50 insertions(+)
>>>>   create mode 100644 package/libgphoto2/Config.in
>>>>   create mode 100644 package/libgphoto2/libgphoto2.hash
>>>>   create mode 100644 package/libgphoto2/libgphoto2.mk
>>> Thanks for this patch. However:
>>>
>>>   - You already posted a patch for the same package on March, 13th, but
>>>     you don't explain how this version is different. This patch is not
>>>     even identified as a new iteration. What changed?
>>>
>>>   - Romain Naour submitted on March 5 a patch adding libgphoto2, so your
>>>     proposal seems a bit redundant with Romain's patch. Have you taken
>>>     over Romain's patch? I'm adding Romain in Cc here.
>>>
>>> Thanks!
>>>
>>> Thomas
>> -- 
>>
>> *Kevin JOLY*
>> Embedded systems engineer
>>
>> SenseFly <http://www.sensefly.com/>
>> 38, rte de Gen?ve
>> 1033 Cheseaux-Lausanne, Switzerland
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>

Best regards,

-- 

*Kevin JOLY*
Embedded systems engineer

SenseFly <http://www.sensefly.com/>
38, rte de Gen?ve
1033 Cheseaux-Lausanne, Switzerland

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170410/c0a64a0b/attachment.html>
