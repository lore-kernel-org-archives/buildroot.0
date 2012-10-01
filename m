From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Mon, 1 Oct 2012 08:44:38 +0300
Subject: [Buildroot] [PATCH v3 1/2] pcsc-lite: new package
In-Reply-To: <50685E64.8040908@mind.be>
References: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <50685E64.8040908@mind.be>
Message-ID: <99B09243E1A5DA4898CDD8B7001114481803AEBA7D@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>  There is also a --enable-usbdropdir which defaults to
>/usr/local/lib/pcsc/drivers.  We avoid using /usr/local, so could
>you make that point to /usr/lib/pcsc/drivers?  Or is it anyway
>not used?

Then we have to set --prefix=/usr as  it defaults to /usr/local. If we do so usbdropdir will be correct as well.

Thanks,
/Waldek
