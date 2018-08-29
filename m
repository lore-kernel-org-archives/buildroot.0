From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 29 Aug 2018 07:44:37 +0200
Subject: [Buildroot] [PATCH] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <451277c2-effe-1d73-f2b3-9c2daf59c2c0@micronovasrl.com>
References: <20180828170153.42156-1-giulio.benetti@micronovasrl.com>
 <CADHdJwDAnbFAe3bGTQswK1OdfQzN+JCCwCPLGhLy1MCmz0bBTQ@mail.gmail.com>
 <fa955ebd-e988-0bb2-f506-ca164477b34f@micronovasrl.com>
 <20180828215714.5e2c7c84@windsurf.home>
 <451277c2-effe-1d73-f2b3-9c2daf59c2c0@micronovasrl.com>
Message-ID: <CA+_SqVZ0B7mH+fou8=V9b4PfWbxeN-WFRtuaG=-GAWDGXLoe6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio

On Tue, Aug 28, 2018 at 10:35 PM, Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
> Hello,
>
> Il 28/08/2018 21:57, Thomas Petazzoni ha scritto:
>>
>> Hello,
>>
>> On Tue, 28 Aug 2018 19:26:53 +0200, Giulio Benetti wrote:
>>
>>> If this makes sense I can resend this patch using the patch you've
>>> pointed me to.
>>
>>
>> Yes, if there is already the same patch committed upstream, we want to
>> backport the upstream patch. Thanks!
>
>
> Sure, I will use the upstream one I've missed when searching.

Mizra, one of the authors of Mender is releasing a bump of the package
with other fixes. We agreed on waiting on the package bump to fix the
error instead of carrying a patch in buildroot that will bu useful
only for a short period of time.

Sincerely, Angelo

>
> Thanks
> Giulio Benetti
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
