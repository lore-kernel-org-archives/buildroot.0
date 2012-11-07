From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 Nov 2012 09:13:17 +0100
Subject: [Buildroot] [PATCHv2 09/10] uClibc: update-all-config shouldn't
 update default uClibc config
In-Reply-To: <1351063027-13800-10-git-send-email-arnout@mind.be>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-10-git-send-email-arnout@mind.be>
Message-ID: <509A181D.6090701@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> The new update-all-config target will update the uClibc config file
> if BR2_UCLIBC_CONFIG is set, even if it is set to the default value
> in toolchain/uClibc/uClibc-xxx.config.
>
> To avoid this, set the default BR2_UCLIBC_CONFIG to empty, and select
> a default to use in the .mk file.
>
> Note that uclibc-update-config will still overwrite the default file
> in toolchain/uClibc/uClibc-xxx.config - presumably it's intentional.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
