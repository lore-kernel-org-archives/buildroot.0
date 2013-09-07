From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Sep 2013 13:49:09 +0200
Subject: [Buildroot] Two or three stages gcc build?
In-Reply-To: <CAL4-wQrTouutDaj2zCVmCQH4+XpEJMR05_goC2KrcF2HgXotiA@mail.gmail.com>
References: <20130705233831.12030038@skate>
 <9C6FE6D2-322A-41E7-8B82-C623B5C1F754@gmail.com>
 <20130906145821.4ce0ab13@skate>
 <EEBE54E3-BD6F-4BB5-88C4-CB3B51CC1FCC@gmail.com>
 <20130907111552.0d646140@skate>
 <CAL4-wQrTouutDaj2zCVmCQH4+XpEJMR05_goC2KrcF2HgXotiA@mail.gmail.com>
Message-ID: <20130907134909.1619d80c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Guy,

On Sat, 7 Sep 2013 13:45:45 +0200, Martin Guy wrote:
> On 07/09/2013, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> > We do need to support building gcc 4.2.x, because that's the only
> > version for which thee AVR32 architecture is supported.
> 
>  A few months ago I incorporated and improved the new AVR32 support
> for gcc 4.3 and 4.4. Since AVR's dirty patches also affect code
> generation on other non-AVR32 processors, I chose to do the
> development outside the main branch but the results, a fork of ct-ng,
> are visible at https://spaces.atmel.com/gf/project/ct-ng/

Yes, I have seen that (maybe you announced it already on the ct-ng
mailing list). I personally don't care enough about AVR32 to spend some
time integrating this in Buildroot, but I've Cc'ed Simon Dawson who
might be interested.

That said, even gcc 4.4 is relatively "old" by these days standards, so
I am not sure it would make a huge difference compared to keeping the
existing gcc 4.2.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
