From: Noam Camus <noamc@ezchip.com>
Date: Sun, 22 Dec 2013 20:53:30 +0200
Subject: [Buildroot] [PATCH 02/29] ARC: [eznps] support
	OVERRIDE_SRCDIR	feature for uclibc
Message-ID: <264C179F799EF24AB26D5319053335E80E59BD78A3@ezexch.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Yes it was intentionality.
I send only the ones that seem to me as generic.
Noam

On Dec 22, 2013 7:41 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
Dear Noam Camus,

On Sun, 22 Dec 2013 17:31:03 +0200, Noam Camus wrote:
> fix 2 issues:
> 1) need to set .config, which normally it is at post patch hook
> 2) need to rsync *.old directories/files excluded by --cvs-exclude
>
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  package/uclibc/uclibc.mk |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)

You sent five patches to the Buildroot mailing list, but they are part
of a 29 patch series. We did not receive the entire patch series.

Was this intentional?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
