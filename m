From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 23:34:29 +0200
Subject: [Buildroot] build error for nios2,
	based on kernel headers	selection
In-Reply-To: <Pine.LNX.4.64.0710091632500.6683@localhost.localdomain>
References: <Pine.LNX.4.64.0710091632500.6683@localhost.localdomain>
Message-ID: <20071009213425.GV20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 04:38:53PM -0400, Robert P. J. Day wrote:
>
>  first time taking a crack at buildroot, selected "nios2", at which

Select BR2_DEPRECATED.
nios2 looks like not too well supported in various upstream packages.
