From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Dec 2017 14:00:57 +0100
Subject: [Buildroot] [PATCH 8/8] support/testing: add tests for ATF
In-Reply-To: <87o9n9yu6k.fsf@dell.be.48ers.dk>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-9-thomas.petazzoni@free-electrons.com>
 <87o9n9yu6k.fsf@dell.be.48ers.dk>
Message-ID: <20171211140057.6abfc914@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 08 Dec 2017 19:02:27 +0100, Peter Korsgaard wrote:

>  > These new tests only do build tests, but allow to quickly verify that
>  > the ATF/U-Boot combinations for vexpress, Allwinner and Marvell
>  > platforms all continue to build properly.  
> 
> We will presumably soon have defconfigs using each 3 variants, so I
> don't know how useful this is - But Ok, we can add it for now.

Yes, I also thought about this when writing the tests. The main
motivation for writing the tests is that they allowed me to test the
ATF package very quickly, by running 3 tests that are very focused on
building just ATF+U-Boot: they don't build a toolchain, a kernel, etc.
As such, such tests are much more usable for someone doing active
development on the ATF package and who wants to verify that things
continue to build properly.

And since I had them written, I thought I would submit them as well :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
