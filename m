From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Wed, 17 Apr 2013 13:06:42 -0700
Subject: [Buildroot] [PATCH 1/1] fs: add uimage support w/ example for
 cpio
In-Reply-To: <CAEBucnBALqQYs+GM5siAXwrnZLU54j1n5zTZFQwhTZPofVVM6Q@mail.gmail.com>
References: <1366225654-11562-1-git-send-email-spenser@gillilanding.com>
 <CAEBucnBALqQYs+GM5siAXwrnZLU54j1n5zTZFQwhTZPofVVM6Q@mail.gmail.com>
Message-ID: <9dadaaac-d8cd-4050-bf0b-39c63bdee154@CO9EHSMHS011.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 17, 2013 at 02:08:40PM -0500, Spenser Gilliland wrote:
> This fixes the white space errors.
Did you sent out the correct version? I still get:
	Applying: fs: add uimage support w/ example for cpio
	/workspaces/sorenb/buildroot.git/.git/rebase-apply/patch:63: trailing whitespace.
	          Add a u-boot header to the cpio root filesystem.  This allows 
	/workspaces/sorenb/buildroot.git/.git/rebase-apply/patch:65: trailing whitespace.
	 
	warning: 2 lines add whitespace errors.

When I apply the patch.

	S?ren
