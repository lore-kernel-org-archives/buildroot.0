From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Fri, 5 Oct 2012 12:57:47 +0300
Subject: [Buildroot] [PATCH v3 2/2] ccid: new package
In-Reply-To: <50686122.5080601@mind.be>
References: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <1348212739-32093-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <50686122.5080601@mind.be>
Message-ID: <99B09243E1A5DA4898CDD8B7001114481803B96ADC@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>  When installing, ccid says:
>copy the src/92_pcscd_ccid.rules file in udev directory (/etc/udev/rules.d/)
>Perhaps it would be a good idea to do that?  (If BR2_PACKAGE_UDEV, of course)

or maybe "if BR2_ROTFS_DEVICE_CREATION_DYNAMIC_UDEV" would be better ?
Should  POST_UNINSTALL_TARGET_HOOKS be added as well ?

>  Also, ccid has the same --enable-embedded option as pcsc-lite.  I'm not
>sure if it is functional, though.

I doubt as well. Will leave it as it's.


Thanks,
/Waldek
 
