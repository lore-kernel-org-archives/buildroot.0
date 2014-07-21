From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 20:27:17 +0200
Subject: [Buildroot] Raspberry Pi Compilation Error
In-Reply-To: <CALRX=SHNnea4sVXWa7W_4yYNa47n9HUKs9xBJwEce_=xpBXRqA@mail.gmail.com>
References: <CALRX=SHNnea4sVXWa7W_4yYNa47n9HUKs9xBJwEce_=xpBXRqA@mail.gmail.com>
Message-ID: <20140721202717.11e8d02e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Giovanni Balestrieri,

On Mon, 21 Jul 2014 19:03:04 +0200, Giovanni Balestrieri wrote:

>    Download Busybox and untar it
> 
>    *wget http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2
>    <http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2> && tar xjf
>    busybox-1.22.1.tar.bz2*

If you're using Buildroot, there's no point in building Busybox
yourself: building things is precisely what Buildroot is meant for.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
