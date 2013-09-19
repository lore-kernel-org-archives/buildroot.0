From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 19:36:26 +0200
Subject: [Buildroot] [PATCH] qt5base: fix build when egl headers need a
 definition
In-Reply-To: <20130919061233.35eb34e3@skate>
References: <1379503071-5446-1-git-send-email-fatih.asici@gmail.com>
 <20130918185539.00adb05c@skate> <523A1AE3.9090802@mind.be>
 <20130919061233.35eb34e3@skate>
Message-ID: <523B361A.6070603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 06:12, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 18 Sep 2013 23:28:03 +0200, Arnout Vandecappelle wrote:
>
>>>>> +++ b/package/qt5/qt5base/qt5base-egl-cflags.patch
>>> All patches should have a description, and a Signed-off-by line. See
>>> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.
>>
>>    Also, please give your patch a number so that the order in which
>> they're applied is predictable. At the moment this probably doesn't
>> matter much, but it makes it easier later on to make sure a new patch
>> will be applied after this one.
>
> Yeah, I also wanted to ask that, but there are existing patches for
> qt5base that doesn't comply with this, so I felt that it was maybe not
> appropriate to ask a contributor to fix our (my ?) mess :-)
>
> But indeed, Fatih, as a preparation patch, you could add number to the
> existing patches, and then add your own.

  I didn't say to add a number to the existing patches. Since the order 
doesn't matter for this patch, you can just give this patch a number and 
leave the other ones alone. This is particularly relevant since your qt5 
version bumping patch removes some of the patches, so renaming would give 
a conflict...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
