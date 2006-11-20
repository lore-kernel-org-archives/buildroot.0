From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 20 Nov 2006 18:18:22 +0100
Subject: [Buildroot] patch: lvm2.mk
In-Reply-To: <20061120152837.GB3065@priv.blacknet.de>
References: <20061120152837.GB3065@priv.blacknet.de>
Message-ID: <20061120171822.GE8032@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 20, 2006 at 04:28:37PM +0100, Goetz Bock wrote:
>Dear list,
>
>building lvm2 as user failes, as the install step tries to write to
>/etc/lvm/. Patch follows:

Funnily i don't see this.
Can you please paste the error where it tries to write to /etc/lvm/* ?

Also, that cp -a should better install-strip the binaries!
