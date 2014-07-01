From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 01 Jul 2014 17:20:37 -0300
Subject: [Buildroot] [PATCH 01/10] arch: deprecate the AVR32 architecture
In-Reply-To: <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53B31815.9010602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2014 03:03 PM, Thomas Petazzoni wrote:

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
> Cc: Simon Dawson <spdawson@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

In this case in particular this is not something new and it's being
decaying for quite a while with nobody stepping up.
With old toolchain components bitroting it's been a while since i've
been able to build a toolchain for avr32, much less test anything for it.
Regards.
