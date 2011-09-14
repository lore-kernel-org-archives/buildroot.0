From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Sep 2011 13:59:36 +0200
Subject: [Buildroot] linux.mk: custom tarball: re-download if tarball
	changed
In-Reply-To: <20110914134900.308755f9@skate>
References: <CAAXf6LWpKhWVSWmxBHcp5gNmMRK0C9Z5Fw72bPXb7QJ1xmRGdQ@mail.gmail.com>
 <CAAXf6LVeSpEph0Lkdyxx2YdyBF5cNK4DJq0PnjW8A84BBXtnHw@mail.gmail.com>
 <20110914134900.308755f9@skate>
Message-ID: <CAAXf6LV=e0QTws58sFjFU0nfx1aT+PLRScwQysyZsyX8U5sOsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 14, 2011 at 1:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 14 Sep 2011 12:16:47 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Bump...
>
> Well, this patch clearly no longer applies on current git, since the
> Linux build stuff has been converted to GENTARGETS.

Yes, I realized that, quote:

"I wanted to submit this to the list, but just noticed that linux is
now using the gentargets infrastructure. To address this problem we
can
a. adapt gentargets, so that the generic .stamp_downloaded rule also
depends on the downloaded archive. Is there any reason why this would
not be good?
b. adapt the version string in linux.mk so that a custom tarball is
automatically picked up."

Best regards,
Thomas
