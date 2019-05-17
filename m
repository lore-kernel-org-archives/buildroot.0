From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 May 2019 17:29:11 +0300
Subject: [Buildroot] [PATCH] package/cog: install to staging
In-Reply-To: <20190516152750.6badca4b@windsurf>
References: <20190516095858.33732-1-cturner@igalia.com>
 <20190516152750.6badca4b@windsurf>
Message-ID: <20190517172911.GB3458@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 16 May 2019 15:27:50 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Charlie,
> 
> On Thu, 16 May 2019 10:58:58 +0100
> Charlie Turner <cturner@igalia.com> wrote:
> 
> > This is useful when unstripped libraries are installed into staging. It
> > allows the cog executable to be debugged.
> 
> Missing Signed-off-by line, but an identical patch was already proposed
> by Adrian:
> 
>   http://patchwork.ozlabs.org/patch/1100157/

Today I had a quick private chat with Charlie and we have agreed on
withdrawing his patch and go ahead with mine :-)

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190517/4a79388b/attachment.asc>
