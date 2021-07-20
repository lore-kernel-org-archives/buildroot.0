From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:44:43 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.67
In-Reply-To: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
References: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210720224443.24edcd0f@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Giulio,

On Sat, 12 Jun 2021 19:35:13 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Note: NSS 3.67(like NSS 3.66) requires NSPR 4.31.
> Release Notes (not yet available, but should eventually land):
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.67_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

This patch doesn't apply in master: master has libnss 3.65, and your
patch assumes a code base that has libnss 3.66.

Also, according to your reply to this e-mail, libnspr 4.31 is needed as
a requirement for this bump of libnss, so you should always resend both
in a single series.

Could you resend the libnspr and libnss version bumps in a single patch
series, rebased on master ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
