From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 22 Aug 2019 07:57:17 -0300
Subject: [Buildroot] [git commit branch/next] package/util-linux: build
 programs and libraries in separate packages
In-Reply-To: <20190821213725.87BE28428E@busybox.osuosl.org>
References: <20190821213725.87BE28428E@busybox.osuosl.org>
Message-ID: <CAJ4jsaf1JwSsi_frDxm_sJt28tP1UJ7xJ-s0CKWRFS3J9w+DNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, Aug 21, 2019 at 6:41 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=335c77b667c68975b65edd0ac0d6ec214a9cb1c6
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>
> The findmount and lsblk utilities need udev to work correctly but cannot
> be built with udev support because the packages providing libudev (eudev
> and systemd) depend on util-linux, creating a chicken-egg problem. Solve
> it by means of the following changes:

Thank you for taking care of this. I have been very busy these days
and was unable to pay attention to Buildroot.

-- 
Carlos Santos <unixmania@gmail.com>
