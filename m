From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Nov 2018 12:05:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-yarl: new package
In-Reply-To: <1540200696-4586-1-git-send-email-james.hilliard1@gmail.com>
References: <1540200696-4586-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <a176443a-34ab-e9fd-9486-bfc3ce91fbdf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/10/18 11:31, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Yet another URL library
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                           |  3 +++
>  package/Config.in                    |  1 +
>  package/python-yarl/Config.in        |  9 +++++++++
>  package/python-yarl/python-yarl.hash |  5 +++++
>  package/python-yarl/python-yarl.mk   | 13 +++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-yarl/Config.in
>  create mode 100644 package/python-yarl/python-yarl.hash
>  create mode 100644 package/python-yarl/python-yarl.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3bcbf81..3ee4050 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1013,6 +1013,9 @@ F:	configs/orangepi_zero_plus2_defconfig
>  F:	configs/pine64_defconfig
>  F:	configs/pine64_sopine_defconfig
>  
> +N:      James Hilliard <james.hilliard1@gmail.com>
> +F:      package/python-yarl/

 That should be a tab instead of spaces.

 Committed to master with that fixed, thanks.

 Regards,
 Arnout
