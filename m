From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 24 Nov 2015 16:15:08 +0100
Subject: [Buildroot] [PATCH v4] android-tools: add new package
In-Reply-To: <CAFGQKxcZERH0vMo8S_gE-YFWN_etHCB2xcAaBvzqgALRj5s7wg@mail.gmail.com>
References: <1448296032-7781-1-git-send-email-gary.bisson@boundarydevices.com>
 <CAFGQKxcZERH0vMo8S_gE-YFWN_etHCB2xcAaBvzqgALRj5s7wg@mail.gmail.com>
Message-ID: <CAAMH-ys65yXKR+T3K304Dk9iyrzeJr6Z7g-ARH9N0zOrNcNE_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On Mon, Nov 23, 2015 at 8:02 PM, Martin Bark <martin@barkynet.com> wrote:
> <snip>
>> +++ b/package/android-tools/android-tools.mk
>> @@ -0,0 +1,85 @@
>> +################################################################################
>> +#
>> +# android-tools
>> +#
>> +################################################################################
>> +
>> +ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
>> +ANDROID_TOOLS_VERSION = 4.2.2+git20130218
>
> Debian now has version 5.1.1.r29 would it be better to use this newer
> version?  It seems to fix this bug
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=798305 where adb in
> 4.2.2 fails on newer android devices.  You can find
> android-tools_5.1.1.r29.orig.tar.xz here
> http://snapshot.debian.org/package/android-tools/5.1.1.r29-2.  It
> looks like Debian only added this a few weeks back.

Thanks for the update. However the Debian package doesn't provide adbd
support which is, in my opinion, a quite useful feature to have.
I'll look at how much effort it is to add adbd support but I might
also wait for the Ubuntu package to be updated.

Regards,
Gary
