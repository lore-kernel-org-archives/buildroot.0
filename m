From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 09 Dec 2012 23:54:39 -0300
Subject: [Buildroot] [PATCH 1/1] libusb-compat : bump version
In-Reply-To: <1355098775-25152-1-git-send-email-sagaert.johan@skynet.be>
References: <1355098775-25152-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <50C54EEF.6030305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/09/2012 09:19 PM, Sagaert Johan wrote:

> There seemed to be another more recent version around
> of the libusb-compat package.
> The new version fixes the Segmentation fault of the usb_modeswitch package.

Not really, you're changing to the old libusb library there.
You're "fixing" the problem probably because the old libusb wasn't threaded.
Sounds very much like the old uClibc bug i mentioned in my previous mail.
Regards.
