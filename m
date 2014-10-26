From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 11:38:45 +0100
Subject: [Buildroot] [PATCH 1/1] Add proxy download support
In-Reply-To: <20141024232355.GC14818@free.fr>
References: <1413903203-33909-1-git-send-email-kaszak@gmail.com>
 <20141024232355.GC14818@free.fr>
Message-ID: <20141026113845.02aad611@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 24 Oct 2014 16:23:55 -0700, Yann E. MORIN wrote:

> On 2014-10-21 16:53 +0200, Karoly Kasza spake thusly:
> > This patch adds support for downloading sources over a http proxy.
> > Supports wget with http, https & ftp targets, bzr, hg, svn.
> > Git does work with forcing https instead of git protocol.
> > Cvs is not supported, but Buildroot does not currently have any
> > packages relying on cvs repos (plus this would fall back to the
> > Buildroot mirror over http).
> > 
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> 
> After speaking with Peter, and given the feedback from both Arnout and
> I, we believe this belongs to the user's settings, and has no place in
> Buildroot.

I agree with this decision, but I certainly wouldn't be opposed to an
addition to the manual that explains what to use Buildroot through
proxies. At least the relevant pointers to the appropriate environment
variables, some hints, etc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
