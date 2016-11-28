From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 28 Nov 2016 06:34:41 -0500
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
	application
In-Reply-To: <20161127144731.18bd30cb@free-electrons.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
 <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
 <CAK8F28mHwYonzL1Wx052TXCzd3U4TjvfQiMPuqxuQmRBLv-2zg@mail.gmail.com>
 <20161127144731.18bd30cb@free-electrons.com>
Message-ID: <CAK8F28mp6tU3oncTK5FpNqUU9o-z0fUOMOxoGYEw7yeRd9uJ5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 27, 2016 at 8:47 AM, Thomas Petazzoni <thomas.petazzoni@free-
electrons.com> wrote:
>
> Why is pru-software-support a host package? It really builds/installs
> things for the target, even if the target is the PRU and not the ARM.
>
> Was it made a host tool after a discussion with Arnout?
It is really best described as a staging package for the PRU. There are
only headers and a library used for static linking. IIRC, Arnout suggested
that putting this as staging was confusing---these aren't for the target
e.g. ARM---and suggested instead that we treat them as host tools along
with the rest of the tool chain.
Ash
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161128/2de3709a/attachment.html>
