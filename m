From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:30:06 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: fix distclean removal of $(O)
In-Reply-To: <1479867782-2666-1-git-send-email-danomimanchego123@gmail.com>
References: <1479867782-2666-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20161123233006.7d14d2b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 21:23:02 -0500, Danomi Manchego wrote:
> The distclean target no longer removes the "output" directory for
> in-tree builds, because $(O) is no longer just "output" in that
> case. Change the test to be against "$(CURDIR)/output", to match
> the O setting, and a similar test elsewhere in the same Makefile.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
