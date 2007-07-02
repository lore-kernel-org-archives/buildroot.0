From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 2 Jul 2007 10:56:15 +0200
Subject: [Buildroot] bug in udhcp where sed fails
In-Reply-To: <4685F6A0.1090202@teamboyce.co.uk>
References: <4685F6A0.1090202@teamboyce.co.uk>
Message-ID: <20070702085615.GB4937@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 30, 2007 at 07:22:24AM +0100, Rod Boyce wrote:
>All,
>
>I have tracked down a bug in the package/udhcp/udhcp.mk file where sed 

udhcp was merged intobusybox some years ago; use a recent busybox
instead! (see r18990)
