From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 29 Apr 2021 20:45:13 +0800
Subject: [Buildroot] [PATCH 1/4] boot/opensbi: add support for version
 configuration
In-Reply-To: <20210429074636.724046-2-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <20210429074636.724046-2-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmWYv05bjCEdJEbLY_e5QaPsKb=pHxyo53E4u8S+j4fLUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 3:48 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> OpenSBI contains platform-specific code, so very much like Linux,
> U-Boot or other bootloaders, using the upstream version of OpenSBI
> will very often not be sufficient.
>
> This commit therefore adds the possibility of specifying a custom
> version of OpenSBI, either custom from upstream, custom tarball, or
> custom from Git. Support for other version control systems has not
> been implemented for now, but could be added later if needed.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/opensbi/Config.in  | 51 +++++++++++++++++++++++++++++++++++++++++
>  boot/opensbi/opensbi.mk | 19 ++++++++++++++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
