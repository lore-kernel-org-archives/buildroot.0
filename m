From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Thu, 14 Feb 2008 14:53:15 -0800
Subject: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405
In-Reply-To: <135252.4598.qm@web58211.mail.re3.yahoo.com>
References: <135252.4598.qm@web58211.mail.re3.yahoo.com>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE10950217A@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For powerpc, we had to resort to building the kernel separate from
buildroot and then install it into the staging area.  It is a bit of a
hack.  I think that with kernel 2.6.24, the ppc stuff has mostly been
migrated to powerpc (at least I think the 4xx family has migrated).
This means that soon we should see much better powerpc architecture
support in projects like buildroot for the kernel.  I have found that
most packages I have used in buildroot have cross compiled OK (sometimes
with the odd bit of shoe horn work)

Regards,

Darcy


________________________________________
From: Steve Calfee [mailto:nospamcalfee at yahoo.com] 
Sent: Thursday, February 14, 2008 1:58 PM
To: Darcy Watkins; buildroot at uclibc.org
Cc: mj at ucw.cz
Subject: Re: [Buildroot] pciutils-2.2.6 fails to build for powerpc 405

Hi, 
A while back I tried to build a 823 system. I couldn't get the kernel to
compile. The kernel has both ppc and powerpc trees - which one are you
using for the 405? Do you have any idea why there are two and what is
the important difference?

Thanks, Steve
--snip!--
