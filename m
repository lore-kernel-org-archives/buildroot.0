From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 Nov 2012 09:13:09 +0100
Subject: [Buildroot] [PATCHv2 08/10] crosstool-ng: update-all-config
 shouldn't update default crosstool-ng config
In-Reply-To: <1351063027-13800-9-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-9-git-send-email-arnout@mind.be>
Message-ID: <509A1815.6000203@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> The new update-all-config target will update the ctng config file
> if BR2_TOOLCHAIN_CTNG_CONFIG is set, even if it is set to the
> default value in toolchain/toolchain-crosstool-ng/crosstool-ng.config-xxx
>
> To avoid this, set the default BR2_TOOLCHAIN_CTNG_CONFIG to empty,
> and select a default to use in the .mk file.
>
> Note that ctng-update-config will still overwrite the default
> file in toolchain/toolchain-crosstool-ng/crosstool-ng.config-xxx -
> presumably it's intentional.
>
> Also factored out the often-qstripped BR2_TOOLCHAIN_CTNG_LIBC (thereby
> adding a few missing qstrips).
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Luca Ceresoli

Luca
