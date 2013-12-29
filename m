From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 Dec 2013 18:40:50 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: update Linaro
	AArch64 toolchains
In-Reply-To: <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LX9ZMaBppPWkRG1me5h5EZ9umV-8MGKWVyN+EbAW4_hjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 27, 2013 at 12:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Add Linaro AArch64 2013.10 and Linaro AArch64 2013.11, and remove
> Linaro AArch64 2013.07 and Linaro AArch64 2013.08.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

A while back we discussed the desirability of having so many
subsequent versions of the same toolchain type (in this case Linaro).
IIRC (but I did not cross-check with the actual discussion yet) the
conclusion was that it'd be good to use the gcc version as milestone,
and keep e.g. a 4.4, 4.6, 4.8 gcc based Linaro toolchain, but not keep
multiple 4.8-based versions.

Until now this has not yet been implemented. We could do this in a
one-shot approach, or gradually as new toolchains are added. If we opt
for the second option, your current patchset could be revised to align
with the new strategy.

What do you think about that?

Best regards,
Thomas
