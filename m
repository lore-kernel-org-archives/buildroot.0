From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 2 Mar 2018 21:19:08 +0000
Subject: [Buildroot] [PATCH v2 1/1] qt5webkit: fix build issue with
 32-bits armv8-a
In-Reply-To: <20180302161624.bc5u3pib3pfqdc77@archlinux>
References: <20180302115853.4181-1-gael.portay@savoirfairelinux.com>
 <20180302142301.513bb769@windsurf.lan>
 <20180302161624.bc5u3pib3pfqdc77@archlinux>
Message-ID: <20180302211908.GB10228@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Mar 2018 11:16:24 -0500, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:
 
> On Fri, Mar 02, 2018 at 02:23:01PM +0100, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Fri,  2 Mar 2018 06:58:53 -0500, Ga?l PORTAY wrote:
> > >
> > > [...]
> > 
> > Do you know why we have this difference between __ARM_ARCH_8__ and
> > __ARM_ARCH_8A__ ?
> 
> Honestly I don't.
> 
> I think that the __ARM_ARCH_8__ is never defined and probably does not
> exist (at least with gcc). But I may be wrong.
> 
> I tried to all the armv8 -mcpu option with gcc and I never had
> __ARM_ARCH_8__ defined.

I haven't got the time to check right now, but I *suspect* that Clang (or
Apple's Clang) uses __ARM_ARCH_8__, because the initial support for 64-bit
ARM was done by Apple and they use Clang. 

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180302/51a23986/attachment.asc>
