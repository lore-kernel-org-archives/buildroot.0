From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 16:08:24 +0100
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump to version
 2.4
In-Reply-To: <1426503299-17058-1-git-send-email-joerg.krause@embedded.rocks>
References: <1426503299-17058-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150316160824.73986f91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 16 Mar 2015 11:54:58 +0100, J?rg Krause wrote:
> Also:
> - remove patches: merged upstream
> - update hash
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Applied, thanks. One minor comment below.

> -# Locally calculated
> -sha256	eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a	wpa_supplicant-2.3.tar.gz
> +# Locally calculated with: sha256sum wpa_supplicant-2.4.tar.gz

"Locally calculated" is sufficient.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
