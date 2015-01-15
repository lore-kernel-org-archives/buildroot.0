From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:40:45 +0100
Subject: [Buildroot] [PATCH] rt-tests: fix build of NTPL dependent tests
In-Reply-To: <e8a70d168927c7e195ed376137ebec128762427f.1421306376.git.baruch@tkos.co.il>
References: <e8a70d168927c7e195ed376137ebec128762427f.1421306376.git.baruch@tkos.co.il>
Message-ID: <20150115094045.32e59d9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 15 Jan 2015 09:19:36 +0200, Baruch Siach wrote:
> Commit 143fe5b443da4 (rt-tests: allow building subset of tests with non-NPTL
> toolchains) disabled build of NPTL dependent tests unconditionally. Fix this.
> 
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Reported-by: "Williams Jr., Ernest L." <ernesto@slac.stanford.edu>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/rt-tests/rt-tests.mk | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied, after fixing the commit title, and reversing the
condition to use positive logic.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
