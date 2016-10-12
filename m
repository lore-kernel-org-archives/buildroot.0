From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:59:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump to version
 2.6
In-Reply-To: <20161011185451.1644-1-joerg.krause@embedded.rocks>
References: <20161011185451.1644-1-joerg.krause@embedded.rocks>
Message-ID: <20161012135942.54de5985@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Oct 2016 20:54:50 +0200, J?rg Krause wrote:
> Remove all patches as they are applied to or were fetched from upstream.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-fix-readline-libs-ordering.patch          | 26 -------
>  ...Key-Data-in-WNM-Sleep-Mode-Response-frame.patch | 32 --------
>  ...-peer-Fix-last-fragment-length-validation.patch | 54 --------------
>  ...erver-Fix-last-fragment-length-validation.patch | 51 -------------
>  ...r-Fix-error-path-for-unexpected-Confirm-m.patch | 34 ---------
>  .../wpa_supplicant/0006-fix-libwpa_client.patch    | 39 ----------
>  ...ate-service-files-according-to-dbus-inter.patch | 77 --------------------
>  ...ject-a-Credential-with-invalid-passphrase.patch | 85 ----------------------
>  ...parameter-set-with-invalid-passphrase-cha.patch | 53 --------------
>  ...ines-from-wpa_supplicant-config-network-o.patch | 84 ---------------------
>  ...CRED-commands-with-newline-characters-in-.patch | 65 -----------------
>  ...commands-with-newline-characters-in-the-s.patch | 53 --------------
>  package/wpa_supplicant/wpa_supplicant.hash         |  2 +-
>  package/wpa_supplicant/wpa_supplicant.mk           |  2 +-
>  14 files changed, 2 insertions(+), 655 deletions(-)
>  delete mode 100644 package/wpa_supplicant/0001-fix-readline-libs-ordering.patch
>  delete mode 100644 package/wpa_supplicant/0002-WNM-Ignore-Key-Data-in-WNM-Sleep-Mode-Response-frame.patch
>  delete mode 100644 package/wpa_supplicant/0003-EAP-pwd-peer-Fix-last-fragment-length-validation.patch
>  delete mode 100644 package/wpa_supplicant/0004-EAP-pwd-server-Fix-last-fragment-length-validation.patch
>  delete mode 100644 package/wpa_supplicant/0005-EAP-pwd-peer-Fix-error-path-for-unexpected-Confirm-m.patch
>  delete mode 100644 package/wpa_supplicant/0006-fix-libwpa_client.patch
>  delete mode 100644 package/wpa_supplicant/0007-systemd-Update-service-files-according-to-dbus-inter.patch
>  delete mode 100644 package/wpa_supplicant/0008-WPS-Reject-a-Credential-with-invalid-passphrase.patch
>  delete mode 100644 package/wpa_supplicant/0009-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch
>  delete mode 100644 package/wpa_supplicant/0010-Remove-newlines-from-wpa_supplicant-config-network-o.patch
>  delete mode 100644 package/wpa_supplicant/0011-Reject-SET_CRED-commands-with-newline-characters-in-.patch
>  delete mode 100644 package/wpa_supplicant/0012-Reject-SET-commands-with-newline-characters-in-the-s.patch

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
