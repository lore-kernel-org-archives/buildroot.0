From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 7 Feb 2017 09:07:55 -0500
Subject: [Buildroot] [PATCH 1/2] gst1-vaapi: new package.
In-Reply-To: <CAFSsvmrw6nKB4-YqBgAEQ_zSYS0otdAKfTWrrC1jcgjHUUFfEw@mail.gmail.com>
References: <20170201131854.3046-1-Adamduskett@outlook.com>
 <20170201223021.2a07c7f0@free-electrons.com>
 <CAFSsvmrw6nKB4-YqBgAEQ_zSYS0otdAKfTWrrC1jcgjHUUFfEw@mail.gmail.com>
Message-ID: <CAFSsvmpcmumaxeansEE6zE_p76h58zdeu1NhTN1bkBraH99SZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Feb 3, 2017 at 8:08 AM, Adam Duskett <aduskett@gmail.com> wrote:
> On Wed, Feb 1, 2017 at 4:30 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Wed,  1 Feb 2017 08:18:53 -0500, Adam Duskett wrote:
>>> gstreamer-vaapi consists in a collection of VA-API based plugins for
>>> GStreamer and helper libraries.  These libraries are used for hardware
>>> decoding and encoding of several video formats.
>>>
>>> decoding formats:
>>> JPEG, MPEG-2, MPEG-4:2, H.264 AVC, H.264 MVC, VP8, VC-1, WMV3, and HEVC.
>>>
>>> encoding formats:
>>> MPEG-2, H.264 AVC, H.264 MVC, JPEG, VP8, HEVC
>>>
>>> The package won't compile without at least one renderer enabled, so I
>>> chose to enable DRM by default, as X11, GLX, and wayland are heavy
>>> handed with the dependencies.  As such, I have disabled every option
>>> defaulting to yes except for DRM for the first patch.
>>>
>>> Also, these codecs are only for x86 and require a Intel CPU (See Hardware
>>> Requirements on line 82 of the README file.)
>>>
>>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>>
>> We already had a patch pending in patchwork adding the same package,
>> proposed by Jesper Baekdahl. Could you please sync with Jesper to
>> propose a single patch?
>>
> Hey Thomas!
>
> I sent an email out just a few minutes ago.  Hopefully, he responds soon!
>
> Question: What is the established procedure if somebody doesn't respond?
>
>
>>
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>
> Thanks!
>
> Adam

I just got word from Jesper; he is fine with my patch.

"Hi Adam,

Sorry for the late answer. You can take over the patch.

Best Regards,

Jesper B?kdahl
Hardware/Software Developer
Gamblify"

So if you find this patch acceptable it looks like he is fine with it!

Adam
