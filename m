From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 25 Mar 2019 12:59:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: Fix loop
 positional declaration build error
In-Reply-To: <20190318171237.032f635c@windsurf>
References: <1552923418-22447-1-git-send-email-email@gmail.com>
 <20190318171237.032f635c@windsurf>
Message-ID: <20190325105916.GA10869@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 18, 2019 at 05:12:37PM +0100, Thomas Petazzoni wrote:
> On Mon, 18 Mar 2019 17:36:58 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > From: Vadim Kochan <vadim4j@gmail.com>
> > 
> > Move 'i' variable outside of the 'for' loop to separate declaration
> > in lib/crc16.c
> > 
> > Fixes:
> > 	http://autobuild.buildroot.net/results/332c9d2232c03440bf71794ee7850b1f6fd51d11/
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> 
> Thanks for the fix, but I already submitted a similar one, and upstream
> U-Boot wants to handle this different, see
> https://lists.denx.de/pipermail/u-boot/2019-February/358821.html. I
> didn't get to doing the change upstream U-Boot suggested.
> 

So, may be then just add your patch to the u-boot-tools package ?

Regards,
Vadim Kochan
