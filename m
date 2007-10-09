From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 18:34:51 +0200
Subject: [Buildroot] Problems building toolchain
In-Reply-To: <470B9BAB.3050407@sfktech.com>
References: <470B9BAB.3050407@sfktech.com>
Message-ID: <20071009163451.GB16889@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 05:18:03PM +0200, Kim Str?ger wrote:

>How do I get passed this point ?

What did you specify as your target CPU and other settings? If in doubt
attach your toplevel .config, please.

Also please do
$ make V=1
and show me the arguments used for the command that fails.
