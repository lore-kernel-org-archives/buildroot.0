From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2018 01:26:59 +0100
Subject: [Buildroot] [RFC PATCH 1/1] libffi: v3.2.1 doesn't support
 riscv targets yet
In-Reply-To: <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
References: <20181023214409.6818-1-ferdinand@ombud.nl>
 <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
Message-ID: <7cc002b4-78a2-31de-421b-23555a2c32bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?Something I forgot...

On 10/24/18 1:24 AM, Arnout Vandecappelle wrote:
>  Personally, I would be fine with doing this gradually, i.e. it is not needed to
> fix all 150 packages in a single commit. Indeed, the build is already broken
> anyway, so if this is shown as a circular dependency warning or as a build
> failure of libffi doesn't matter that much.

?In fact, if you would start doing this, it's best that you post a small patch
(fixing just libffi and one or two dependencies) quickly, so we can check if
you're on the right track.


?Regards,
?Arnout
