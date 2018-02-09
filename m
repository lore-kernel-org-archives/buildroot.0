From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Feb 2018 11:06:43 +0100
Subject: [Buildroot] [next] listing of tests is broken
In-Reply-To: <CAGm1_kuAEFhftNH4UsFUL0Cy-M_0PppKS0C6VdB9WWu+MGqgJw@mail.gmail.com>
References: <CAGm1_kvtXtxu_YjCeXNOUr706hJp-nwrX77QOD9m9B7e3t6ftg@mail.gmail.com>
 <20180209095441.287880e0@windsurf.lan>
 <CAGm1_kuAEFhftNH4UsFUL0Cy-M_0PppKS0C6VdB9WWu+MGqgJw@mail.gmail.com>
Message-ID: <20180209110643.7977e3ba@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Feb 2018 10:04:37 +0100, Yegor Yefremov wrote:

> > I have not yet decided if the right fix is to replace config = None by
> > config = list() in the base test class, or to fix the Rust test case.  
> 
> I'm for the first fix: config = list()

Before going with this fix, I'd like to understand if what the Rust
tests are doing is legit or not. If it isn't, then we may not
necessarily want to paper over the problem.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
