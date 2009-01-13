From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 13 Jan 2009 09:03:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
In-Reply-To: <20090113080053.GD18623@mx.loc>
References: <20090113072656.64F4A76850@busybox.osuosl.org>
	<20090113080053.GD18623@mx.loc>
Message-ID: <20090113090359.007298b4@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Jan 2009 09:00:54 +0100
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:

> On Tue, Jan 13, 2009 at 07:26:56AM +0000, egtvedt at uclibc.org wrote:
> >Author: egtvedt
> >Date: 2009-01-13 07:26:55 +0000 (Tue, 13 Jan 2009)
> >New Revision: 24809
> >
> >Log:
> >samba: properly disable largefile if not selected in Buildroot
> 
> properly would mean using $(DISABLE_LARGEFILE). Please fix.
>

Thanks, corrected.

-- 
Best regards,
Hans-Christian Egtvedt
