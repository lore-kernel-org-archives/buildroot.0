From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 20:55:28 +0200
Subject: [Buildroot] [PATCH] bash: add more security patches
In-Reply-To: <1412353542-23114-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412353542-23114-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141003205528.5e7e88a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  3 Oct 2014 13:25:42 -0300, Gustavo Zacarias wrote:
> Apply new patches for a buffer overflow fix (pl28) and an invalid memory
> access (pl29).
> Rename combined patchlevel patch to be more graphic about the range.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...level27.patch => bash-001-patchlevel1-27.patch} |    0
>  package/bash/bash-002-patchlevel28.patch           | 2270 ++++++++++++++++++++
>  package/bash/bash-003-patchlevel29.patch           |   64 +
>  3 files changed, 2334 insertions(+)
>  rename package/bash/{bash-001-patchlevel27.patch => bash-001-patchlevel1-27.patch} (100%)
>  create mode 100644 package/bash/bash-002-patchlevel28.patch
>  create mode 100644 package/bash/bash-003-patchlevel29.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
