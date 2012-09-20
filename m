From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Thu, 20 Sep 2012 11:01:33 +0300
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <CAHXCMM+5Uu4vdB+kQrke15PJRki-k-meNg=E1_Ai8TceNYZbtA@mail.gmail.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <20120919164706.0e38b54d@skate>
 <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
 <CAHXCMM+5Uu4vdB+kQrke15PJRki-k-meNg=E1_Ai8TceNYZbtA@mail.gmail.com>
Message-ID: <99B09243E1A5DA4898CDD8B70011144818039906CB@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

>choice BR2_PACKAGE_PCSC_LITE_HWLIBS
>  prompt "hardware access/detection" # or whatever more suitable
>  default BR2_PACKAGE_PCSC_LITE_HWLIBS_LIBUDEV
>config BR2_PACKAGE_PCSC_LITE_HWLIBS_NONE
>  bool "none"
>config BR2_PACKAGE_PCSC_LITE_HWLIBS_LIBUSB
>  bool "libusb"
>  select BR2_PACKAGE_LIBUSB
>config BR2_PACKAGE_PCSC_LITE_HWLIBS_LIBUDEV
>  bool "libudev"
>  select BR2_PACKAGE_UDEV
>endchoice

That's the option. Thx. 

Thanks,
/Waldek
