From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 09:34:22 +0100
Subject: [Buildroot] [PATCH 0 of 4] alsa-lib/alsa-utils autobuild fixes
In-Reply-To: <20140222192334.2d6bddd0@skate>
References: <patchbomb.1392224140@argentina> <20140222192334.2d6bddd0@skate>
Message-ID: <CAAXf6LUUJE-9usbwpZS-uG6uYe26J0XPUbfxxGyzGcjoyOPH_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 22, 2014 at 7:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 12 Feb 2014 17:55:40 +0100, Thomas De Schampheleire wrote:
>
>> This series fixes the alsa-lib / alsa-utils autobuild failures, most notably
>> seen on Blackfin FLAT, but the alsa-utils problem was also seen on ARM.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Would you mind resending your series by taking into account Peter's
> comment for PATCH 2, and then replace your PATCH 4 by a patch that
> simply disallow alsa-utils on !MMU systems?
>

Yes, working on it...
