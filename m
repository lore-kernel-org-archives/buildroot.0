From: Kevin JOLY <kevin.joly@sensefly.com>
Date: Fri, 7 Apr 2017 07:14:14 +0200
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <20170406223644.473ebd65@free-electrons.com>
References: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
 <20170406223644.473ebd65@free-electrons.com>
Message-ID: <cd88fd7c-dceb-cef1-59de-e086c6b3df00@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I was talking with Romain on this mailing list and he had concern about 
license and dependencies of libgphoto2. I contacted the developpers of 
libgphoto2 to ensure that the license type was correct. I also turned 
the libexif, jpeg and gd dependencies as optional.

Anyway, if the patch is in the pipe, everything is fine. I re-submitted 
it because I didn't saw it was already on patchwork but I didn't wanted 
to be redundant with it.

Thank you

Kevin JOLY

Le 06. 04. 17 ? 22:36, Thomas Petazzoni a ?crit :
> Hello,
>
> On Thu, 6 Apr 2017 10:33:12 +0200, Kevin JOLY wrote:
>> Add support for libgphoto2 core library designed to allow access to digital camera.
>>
>> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
>> ---
>>   DEVELOPERS                         |  3 +++
>>   package/Config.in                  |  1 +
>>   package/libgphoto2/Config.in       | 11 +++++++++++
>>   package/libgphoto2/libgphoto2.hash |  6 ++++++
>>   package/libgphoto2/libgphoto2.mk   | 29 +++++++++++++++++++++++++++++
>>   5 files changed, 50 insertions(+)
>>   create mode 100644 package/libgphoto2/Config.in
>>   create mode 100644 package/libgphoto2/libgphoto2.hash
>>   create mode 100644 package/libgphoto2/libgphoto2.mk
> Thanks for this patch. However:
>
>   - You already posted a patch for the same package on March, 13th, but
>     you don't explain how this version is different. This patch is not
>     even identified as a new iteration. What changed?
>
>   - Romain Naour submitted on March 5 a patch adding libgphoto2, so your
>     proposal seems a bit redundant with Romain's patch. Have you taken
>     over Romain's patch? I'm adding Romain in Cc here.
>
> Thanks!
>
> Thomas

-- 

*Kevin JOLY*
Embedded systems engineer

SenseFly <http://www.sensefly.com/>
38, rte de Gen?ve
1033 Cheseaux-Lausanne, Switzerland

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/14948f39/attachment.html>
