From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:20:44 +0100
Subject: [Buildroot] [PATCH 1/1] avahi: move libdns_sd compat hook
 definition inside conditional block
In-Reply-To: <1456887367-2543-1-git-send-email-danomimanchego123@gmail.com>
References: <1456887367-2543-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20160302212044.3cffdfe9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Tue,  1 Mar 2016 21:56:07 -0500, Danomi Manchego wrote:
> As directed in the buildroot manual, "Optional hooks: keep hook
> definition and assignment together in one if block".  And also
> to be consistent with the rest of avahi.mk.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/avahi/avahi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
