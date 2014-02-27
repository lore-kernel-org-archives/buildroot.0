From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 27 Feb 2014 09:05:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-26
In-Reply-To: <20140227073008.AB700100F42@stock.ovh.net>
References: <20140227073008.AB700100F42@stock.ovh.net>
Message-ID: <CAAXf6LW9iWEO6R6i6ROT+NGpgK4crmqSmagHbkb49bgZApkwbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 27, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>        arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/432be0db3f8415f6a026b69234579ad4d23b6421/

pcsc-lite does not detect libusb, because the conftest for libusb_init
does not compile with thread support (while threads are enabled). I
will try to fix this.

Best regards,
Thomas
