From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 25 Jul 2011 20:07:45 +0000
Subject: [Buildroot] BR2_PREFER_STATIC_LIB and external toolchain
Message-ID: <F9C551623D2CBB4C9488801D14F864C6047C5D@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I select both PREFER_STATIC and external toolchain, I get .so's 
copied to the RFS from the external toolchain.  Would it cause anyone
any heartburn if I we make the install to target dependant on
PREFER_STATIC?  I'll do up the patches, I just want to know if that
would upset anyone before I send out the patch ;).

Andy
