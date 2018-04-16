From: AAlex_ <earthquake.de@freenet.de>
Date: Mon, 16 Apr 2018 13:18:12 -0700 (MST)
Subject: [Buildroot] makedev capabilities support - capablities lost
 after booting the image
In-Reply-To: <20180416123143.jinljoxct6srmvzf@sapphire.tkos.co.il>
References: <1523881062231-0.post@n4.nabble.com>
 <20180416123143.jinljoxct6srmvzf@sapphire.tkos.co.il>
Message-ID: <1523909892138-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
Changed to  ext4, but thanks for the hint.
Forgot to set the ext4 posix Extension in Kernel.
Now it works.

Alex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
