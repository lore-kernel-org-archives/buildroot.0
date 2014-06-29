From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Sun, 29 Jun 2014 19:45:30 +0000
Subject: [Buildroot] [PATCH] uclibc: fix tests building in uClibc
	0.9.33.2
In-Reply-To: <0565f572-9253-4d0c-992b-6de65c123f83@email.android.com>
References: <1404069506-13826-1-git-send-email-abrodkin@synopsys.com>
 <0565f572-9253-4d0c-992b-6de65c123f83@email.android.com>
Message-ID: <1404071129.7954.11.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2014-06-29 at 21:37 +0200, Thomas De Schampheleire wrote:
> When taking patches via a git web interface, it's important to check the full patch, not limited to a particular file or subdirectory, as is the case here. You can do that by browsing up the file hierarchy once a revision is selected, or do manual editing of the url remove the path.
> 
> This is because there may be changes in other places for this patch...
> 
> Same comment on the other patches added...

Thanks for this warning.
I did notice this strange behavior earlier so this time I double-checked
if patches are complete.

Moreover the best proof of concept is successful build :)

References to gitweb I put just for convenience of next
users/developers.

-Alexey
