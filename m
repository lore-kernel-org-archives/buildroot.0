From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 29 Apr 2021 20:45:37 +0800
Subject: [Buildroot] [PATCH 2/4] boot/opensbi: allow using U-Boot as a
 payload
In-Reply-To: <20210429074636.724046-3-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <20210429074636.724046-3-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmVSbB-iYKbiJdbmB7Hk3y23MCXoXo6gQ9MFRUrHRKEiJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 3:47 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> The opensbi package already allows to use Linux as a payload for
> OpenSBI, but in some cases, U-Boot as payload is useful. This commit
> adds a BR2_TARGET_OPENSBI_UBOOT_PAYLOAD option, modeled after the
> existing BR2_TARGET_OPENSBI_LINUX_PAYLOAD.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/opensbi/Config.in  | 7 +++++++
>  boot/opensbi/opensbi.mk | 8 ++++++++
>  2 files changed, 15 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
