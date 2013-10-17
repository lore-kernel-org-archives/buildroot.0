From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Oct 2013 10:47:14 +0200
Subject: [Buildroot] qt5webkit and bison 3.0
In-Reply-To: <20131017082633.GA13085@riot>
References: <20131017082633.GA13085@riot>
Message-ID: <20131017104714.380d6c97@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthias Hardt,

On Thu, 17 Oct 2013 10:26:33 +0200, Matthias Hardt wrote:

> the current buildroot-repository uses bison 3.0. When building
> qt5webkit, there is a known incompatibility to this bison version [1].
> For now I fixed this by using bison 2.7.1 when qt5webkit is chosen.
> Maybe this should be done in the repository as well (at least while
> waiting for the qt5webkit 5.1.2 release which will fix this issue).
> 
> And some other minor inconvenience. qt5webkit needs dependencies to
> host-flex and host-bison.
> 
> I can provide a patch for both issues, if needed.

Thanks for the report! We actually have a patch in our queue
(http://patchwork.ozlabs.org/patch/276231/) that bumps the qt5 version
to qt 5.1.1. Maybe the fix for the issue you're mentioning is already
included in qt 5.1.1 ? Hopefully, Peter will apply this bump soon.

As per the missing host-flex and host-bison dependencies, indeed,
a patch is welcome.

I am however a bit surprised that our autobuilders don't seem to have
hit the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
