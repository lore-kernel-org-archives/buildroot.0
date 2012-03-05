From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Mon, 5 Mar 2012 04:45:14 -0200
Subject: [Buildroot] [PATCH 1/2] openssl: Fix build on ARM with GCC 4.6.x
In-Reply-To: <20120305051937.GA26631@sapphire.tkos.co.il>
References: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
 <20120301053726.GA4978@sapphire.tkos.co.il>
 <20120301153201.58f81290@gmail.com>
 <20120301181031.GA3915@tarshish>
 <20120303211338.14fe3545@gmail.com>
 <20120305051937.GA26631@sapphire.tkos.co.il>
Message-ID: <20120305044514.077a2dd7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 5 Mar 2012 07:19:37 +0200
Baruch Siach <baruch@tkos.co.il> wrote:
> On Sat, Mar 03, 2012 at 09:13:38PM -0200, Ismael Luceno wrote:
> > On Thu, 1 Mar 2012 20:10:32 +0200
> > Baruch Siach <baruch@tkos.co.il> wrote:
> > > Doesn't the patch from r183512 fix this bug?
> > 
> > What is "r183512" supposed to mean?
> 
> This the Subversion commit mentioned in comment #20 of Bugzilla bug
> #48308 that you linked to
<...>

Oh, I thought you were talking about buildroot.

> (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308). Comment #21
> seems to indicate that this fix hasn't been backported to gcc 4.6.x.

Probably not hitting anytime soon.

> Maybe a better solutions would be to add this patch Buildroot's
> internal gcc.

Indeed.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120305/16c2119c/attachment.asc>
