From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 May 2015 17:49:01 +0200
Subject: [Buildroot] showstopper 404 problem ...
In-Reply-To: <050701d09890$1081f7d0$3185e770$@novadsp.com> (g4@novadsp.com's
 message of "Wed, 27 May 2015 16:16:10 +0100")
References: <01a201d0971b$fca690b0$f5f3b210$@novadsp.com>
 <20150525210558.39e88c66@free-electrons.com>
 <01c901d09724$065bca00$13135e00$@novadsp.com>
 <CAJ3iQcpEX=3MBXwHki78F7NhELhQOb=WGapZFSXSzenYi4+R3w@mail.gmail.com>
 <04ce01d09887$9ebdf340$dc39d9c0$@novadsp.com>
 <87pp5mvzvk.fsf@dell.be.48ers.dk>
 <050701d09890$1081f7d0$3185e770$@novadsp.com>
Message-ID: <87lhgavx5e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <g4@novadsp.com> writes:

 > Thank you Peter.
 >> 
 >> Yes, expect the final 2015.05 release by this weekend.
 >> 

 > I am trying rc3 now.

 > I'm still confused by the Toolchain >> Kernel headers and Kernel >> Linux
 > kernel >> Kernel version settings. Why are these independent?  

because you can build a toolchain without building a kernel or reuse an
existing toolchain to build a kernel.

If you do build both, then the versions should match.

-- 
Venlig hilsen,
Peter Korsgaard 
