From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 8 Mar 2016 17:45:28 +0000
Subject: [Buildroot] [PATCH v4] android-tools: add new package
In-Reply-To: <CAAMH-ys65yXKR+T3K304Dk9iyrzeJr6Z7g-ARH9N0zOrNcNE_g@mail.gmail.com>
References: <1448296032-7781-1-git-send-email-gary.bisson@boundarydevices.com>
 <CAFGQKxcZERH0vMo8S_gE-YFWN_etHCB2xcAaBvzqgALRj5s7wg@mail.gmail.com>
 <CAAMH-ys65yXKR+T3K304Dk9iyrzeJr6Z7g-ARH9N0zOrNcNE_g@mail.gmail.com>
Message-ID: <57351aed-03da-40ff-9c76-a384f847820e@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

I use host-fastboot (almost) every days to flash my SECO i.MX6 uQ7 so 
you can add
Tested-by: Julien Corjon <corjon.j@ecagroup.com>

As i use it in an buildroot-external tree I've just noticed this package 
as not been accepted yet.

And for the whole patch you can add
Review-by: Julien Corjon <corjon.j@ecagroup.com>

Le 24/11/2015 16:15, Gary Bisson a ?crit :
> Martin, All,
>
> On Mon, Nov 23, 2015 at 8:02 PM, Martin Bark <martin@barkynet.com> wrote:
>> <snip>
>>> +++ b/package/android-tools/android-tools.mk
>>> @@ -0,0 +1,85 @@
>>> +################################################################################
>>> +#
>>> +# android-tools
>>> +#
>>> +################################################################################
>>> +
>>> +ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
>>> +ANDROID_TOOLS_VERSION = 4.2.2+git20130218
>>
>> Debian now has version 5.1.1.r29 would it be better to use this newer
>> version?  It seems to fix this bug
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=798305 where adb in
>> 4.2.2 fails on newer android devices.  You can find
>> android-tools_5.1.1.r29.orig.tar.xz here
>> http://snapshot.debian.org/package/android-tools/5.1.1.r29-2.  It
>> looks like Debian only added this a few weeks back.
>
> Thanks for the update. However the Debian package doesn't provide adbd
> support which is, in my opinion, a quite useful feature to have.
> I'll look at how much effort it is to add adbd support but I might
> also wait for the Ubuntu package to be updated.

Since there is no update from Ubuntu I suggested to accept this patch 
'as-is' and see later to handle the android-tool bug raised by Martin.

Regards,

Julien

>
> Regards,
> Gary
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
