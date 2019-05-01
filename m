From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 15:39:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: fix patch order
In-Reply-To: <20190428152948.13693-1-fontaine.fabrice@gmail.com>
References: <20190428152948.13693-1-fontaine.fabrice@gmail.com>
Message-ID: <7d1fc69b-ecb2-9adf-eb8b-0183176d0396@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2019 17:29, Fabrice Fontaine wrote:
> Rename 0002-install-don-t-use-ln-relative.patch to
> 0001-install-don-t-use-ln-relative.patch as there is two 0002-xxx
> patches
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied both to master, thanks.

 Regards,
 Arnout


> ---
>  ...ln-relative.patch => 0001-install-don-t-use-ln-relative.patch} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/systemd/{0002-install-don-t-use-ln-relative.patch => 0001-install-don-t-use-ln-relative.patch} (100%)
> 
> diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0001-install-don-t-use-ln-relative.patch
> similarity index 100%
> rename from package/systemd/0002-install-don-t-use-ln-relative.patch
> rename to package/systemd/0001-install-don-t-use-ln-relative.patch
> 
