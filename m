From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:32:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5: add qt5remoteobjects
 library
In-Reply-To: <8ef0b851-e4b8-d2dd-28b8-190ab67dae8c@leiderfischer.de>
References: <8ef0b851-e4b8-d2dd-28b8-190ab67dae8c@leiderfischer.de>
Message-ID: <20200307213245.4db1c5d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Sat, 7 Mar 2020 16:19:12 +0100
Sven Fischer <sven@leiderfischer.de> wrote:

> Qt 5.12 adds a library for IPC. This library is missing from the
> distributed qt5 package. Added it by using the library qt5serialport as
> a template and replaced serialport with remoteobjects, recalculated the
> sha256 sums.
> 
> Signed-off-by: Sven Fischer <sven@leiderfischer.de>

Thanks a lot for your patch. However, it has been badly line-wrapped by
your e-mail client, which makes it impossible to apply, and difficult
to review.

Could you resend it using "git send-email", as instructed in the
Buildroot manual
(https://buildroot.org/downloads/manual/manual.html#submitting-patches) ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
