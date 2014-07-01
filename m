From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 1 Jul 2014 20:35:13 +0200
Subject: [Buildroot] [PATCH 01/10] arch: deprecate the AVR32 architecture
In-Reply-To: <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVdbcEWFWPa_4QfpS3Od7bRsVDieb1odmdNmiEN+3ZGVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 1, 2014 at 8:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The AVR32 architecture from Atmel is obsolete since a long time, not
> supported upstream in most of the toolchain components (requires a
> special version of gcc, an old version of uClibc, etc.). Until
> February, Simon Dawson was making an excellent job at maintaining
> AVR32 in Buildroot, and fixing all the issues caused by this
> architecture. However, Simon focus has changed, and despite his call
> for a new maintainer for AVR32 in Buildroot, nobody stepped up.
>
> The issue of maintaining AVR32 is becoming worse and worse, so this
> patch proposes to deprecate it for 2014.08, but keeping the support
> around, to remove it for sure in 2014.11.
>

While I have no trouble at all with the deprecation of avr32, the
timeline you propose deviates from the usual deprecation timeline.
When I introduced the BR2_DEPRECATED_SINCE_XXXX symbols, we proposed
to take one year (four buildroot releases) as deprecation time, so
deprecating avr32 2014.08 would mean being able to remove it by
2015.08.

I'm ok with explicitly stating the removal happening already in
2014.11, contrary to the usual timeline, provided there is a consensus
with other buildroot developers.

Best regards,
Thomas
