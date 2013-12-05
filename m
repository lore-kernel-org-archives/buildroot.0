From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Dec 2013 06:41:51 -0600
Subject: [Buildroot] [PATCHv6 4/5] core: allow external defconfigs to be
	used
In-Reply-To: <1386198891-17968-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386198891-17968-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OFA79D3A34.9540CD01-ON86257C38.0045A8B8-86257C38.0045BF86@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 12/04/2013 
05:14:50 PM:

> This commit allows the user to store defconfigs in
> $BR2_EXTERNAL/configs/. To achieve this:
> 
>  * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
>    the corresponding defconfig file.
> 
>  * Updates the help target to also list external defconfigs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
