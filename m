From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 8 Nov 2017 19:53:56 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5 add qmake.conf.in for eglfs
In-Reply-To: <2AD72CC1-4D0B-471E-A176-9FF8962712B4@micronovasrl.com>
References: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
 <52578484-a127-0727-e677-49c17058cc17@microchip.com>
 <2AD72CC1-4D0B-471E-A176-9FF8962712B4@micronovasrl.com>
Message-ID: <A02CA621-791B-4E4C-B01B-997C4E76EC77@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Need to re-submit patch?

Giulio

> Il giorno 08 nov 2017, alle ore 19:52, Giulio Benetti <giulio.benetti@micronovasrl.com> ha scritto:
> 
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
>> 
>>> Changes v1 -> v2:
>>> 
>>> * Moved qmake.conf to qmake.conf.in
>>> * Added @EGLFS_DEVICE@ placeholder into qmake.conf.in
>>> * Modified QT5BASE_CONFIGURE_QMAKE_CONFIG to use sed
>>> 
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>> ---
>> 
>> ...
>> 
>> Josh
