From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Wed, 19 Sep 2012 15:54:03 +0300
Subject: [Buildroot] [PATCH 1/2] pcsc-lite: new package
In-Reply-To: <5058E50D.8040005@mind.be>
References: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <5058E50D.8040005@mind.be>
Message-ID: <99B09243E1A5DA4898CDD8B700111448180399044F@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  IIRC, libusb is really optional for pcsc-lite. You can use a
>construct like:
>
>ifeq ($(BR2_PACKAGE_LIBUSB),y)
>PCSC_LITE_CONF_OPT += --enable-libusb
>PCSC_LITE_DEPENDENCIES += libusb
>else
>PCSC_LITE_CONF_OPT += --disable-libusb
>endif
>

Thanks for comments. Already sent out  v2 of the patches.


Thanks,
/Waldek
