From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 11 Apr 2012 12:26:27 +0100
Subject: [Buildroot] [PATCH] Patch gpsd-2.95 for avr32
In-Reply-To: <20120411124018.1cb660eb@skate>
References: <1334140031-29576-1-git-send-email-spdawson@gmail.com>
 <20120411124018.1cb660eb@skate>
Message-ID: <CAHt8ZCNcFpXGb2LdJDTwTD4O-2wP8EKzaZJ5BwODobc+F3YHnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Thanks Simon. I haven't investigated this particular problem. Do you
> know why it would be avr32-specific?

No, I don't know why the problem should be avr32-specific. (The
package builds for arm without the patch, incidentally.)

> Moreover, gpsd 2.95 is quite ancient, the latest version is 3.4, and it
> has this problem fixed (see
> http://git.savannah.gnu.org/cgit/gpsd.git/commit/pseudonmea.c?id=3b00bd2e71d277283062ed83078de9741a4a8b98).
> However, it looks like gpsd is now using Scons as its builds system, so
> bumping to 3.4 will require quite a bit of work on gpsd.mk.

Yes, I realised that it would be non-trivial to just bump the gpsd
version in buildroot. Is the avr32 patch therefore an acceptable
short-term solution to the build problem?
