From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Wed, 19 Sep 2012 10:49:22 +0300
Subject: [Buildroot] [PATCH 2/2] ccid: new package
In-Reply-To: <20120918162224.338721a9@skate>
References: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <1347970772-25135-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <20120918162224.338721a9@skate>
Message-ID: <99B09243E1A5DA4898CDD8B70011144818038C36C4@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

>
>Does ccid directly uses libusb, or does it only use it through
>pcsc-lite? If the latter, then it would be better not to have libusb
>amongst the dependencies here.

It uses libusb directly, so will add missing dependencies.

Thanks,
/Waldek
