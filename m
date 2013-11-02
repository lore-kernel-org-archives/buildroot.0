From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 16:24:29 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <CAAEAJfC44UjLPNEemSEFSJEQAFazyXiFORAE1N82O1DWgcETsQ@mail.gmail.com>
References: <20131029204108.5d707d09@skate> <20131101193153.04cdd643@skate>
 <CAAEAJfC44UjLPNEemSEFSJEQAFazyXiFORAE1N82O1DWgcETsQ@mail.gmail.com>
Message-ID: <20131102162429.544d8a5f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Sat, 2 Nov 2013 13:16:54 -0200, Ezequiel Garc?a wrote:

> Thanks! I'm already looking at them :-)

Great!

> I've been doing some experiments and I expect *lots*
> of broken packages. Unfortunately, these breaks
> are either related to nios2 being an unsupported arch
> (e.g. ltrace, strace) or some toolchain issues (e.g. Qt).
> 
> I'd like to take care of this, but as you can imagine, these
> are pretty challenging problems.

Note that we don't need to support everything on all platforms. If some
package doesn't have support for NIOS 2, then we can simply add a
'depends on !BR2_nios2' to it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
