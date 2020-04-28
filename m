From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 28 Apr 2020 14:51:27 +0300
Subject: [Buildroot] [PATCH 1/1] package/wlroots: bump to version 0.10.1
In-Reply-To: <20200428074035.113f67d9@windsurf.home>
References: <20200428043338.117932-1-james.hilliard1@gmail.com>
 <20200428074035.113f67d9@windsurf.home>
Message-ID: <20200428145127.GE1757280@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 07:40:35 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Mon, 27 Apr 2020 22:33:38 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
> > wlroots dropped RDP backend support in:
> > https://github.com/swaywm/wlroots/commit/ebdbe177d62d3c8bab04f77b86326804ff185bef
> > 
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  Config.in.legacy             | 6 ++++++
> 
> The Config.in.legacy handling was not needed: wlroots was added very
> recently, and was never part of any release. So we don't care about
> legacy handling. I dropped it and applied. Thanks!

Nice! You guys beat me to posting a patch with the update to the latest
version \o/

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200428/b4f2e2e5/attachment.asc>
