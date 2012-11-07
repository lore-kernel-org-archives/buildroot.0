From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 Nov 2012 09:12:37 +0100
Subject: [Buildroot] [PATCHv2 06/10] Add update-all-config target
In-Reply-To: <1351063027-13800-7-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-7-git-send-email-arnout@mind.be>
Message-ID: <509A17F5.9050407@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> The update-all-config target updates all the external configuration
> file with their current values.  This includes:
> - buildroot
> - busybox
> - linux
> - crosstool-ng
> - uClibc
> - at91bootstrap3
>
> Linux and buildroot are saved as defconfigs.  For Linux, this means
> that it will fail on kernels before 2.6.33 (when the savedefconfig
> was added to Linux Kconfig).
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I think this target should be renamed update-all-configs (plural), but
that's just cosmetics, so:

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
