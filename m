From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 10:42:32 +0100
Subject: [Buildroot] [PATCH] uclibc: patch 0.9.31 for avr32,
 to add __kernel_long_t and __kernel_ulong_t data types
In-Reply-To: <CAHt8ZCMoXQ9xmrDrzL5r-5ag3MjQhx=Pb8jbkWi-L676pc67zA@mail.gmail.com>
References: <1384505965-19957-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LUGq3dj4G_wK5udynxcCakN3JJX2o-Dxef-EzJYnvpoqw@mail.gmail.com>
 <20131115102338.47ffb0d4@skate>
 <CAHt8ZCMoXQ9xmrDrzL5r-5ag3MjQhx=Pb8jbkWi-L676pc67zA@mail.gmail.com>
Message-ID: <CAAXf6LW4H1HONMqQy9T4RMuwFHvTHPZNb3VFAyjOLYH46rL9Lw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Fri, Nov 15, 2013 at 10:34 AM, Simon Dawson <spdawson@gmail.com> wrote:
> Hi Thomases.
>
> On 15 November 2013 09:23, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> In the specific case of this patch, it modifies only avr32-specific
>> header files, so I don't quite see why it needs to be
>> named .patch.avr32 instead of just .patch.
>>
>> Especially since anyway 0.9.31 can only be enabled for the AVR32
>> architecture.
>
> I'll rename the patch, and resubmit. As for the other *.patch.avr32
> files, I'll have a look at them as soon as I can.

That would be great, thanks!

Best regards,
Thomas
