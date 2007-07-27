From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 18:03:26 +0200
Subject: [Buildroot] Getting buildroot to compile kernel with
	"V=1"	option
In-Reply-To: <000401c7d064$76d7f540$2c48a8c0@greyhawk.tonecommander.com>
References: <000401c7d064$76d7f540$2c48a8c0@greyhawk.tonecommander.com>
Message-ID: <20070727160326.GC25147@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 27, 2007 at 08:40:31AM -0700, Jerry Richards wrote:
>How can I get buildroot to compile the kernel with the "V=1" option?

You can only pass V=1 to the toplevel make. This will make uclibc and
busybox (and perhaps other packages) be verbose too. There is no more
fine-grained method (and i don't think one is necessary, fwiw).

HTH,
Bernhard
