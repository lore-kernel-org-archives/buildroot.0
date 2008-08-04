From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 4 Aug 2008 15:01:21 +0200
Subject: [Buildroot] Why linux26-modules before linux26
In-Reply-To: <1217651676.6280.11.camel@kokopelli>
References: <1217651676.6280.11.camel@kokopelli>
Message-ID: <20080804130121.GB27672@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 01, 2008 at 09:34:36PM -0700, Brian Beattie wrote:
>I have a kernel that does not want to compile the modules before the
>rest of the kernel.  I've worked around that, but it does raise a
>question that maybe somebody knows the answer to, why are the makefiles
>set  to compile the kernel-modules so early compared to the rest of the
>kernel?

This was added by Steven, IIRC. I don't see a reason why the modules are
built before the kernel.

Steven, can you please explain?
