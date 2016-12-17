From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 13:59:50 +0100
Subject: [Buildroot] amdgpu graphics
In-Reply-To: <d3c4788f-438e-5def-28b0-3deff87e4ee6@carallon.com>
References: <d3c4788f-438e-5def-28b0-3deff87e4ee6@carallon.com>
Message-ID: <20161217135950.12b9f370@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Dec 2016 13:43:05 +0000, Will Wagner wrote:

> Has anyone done any work on packaging this for buildroot?

Nope, I haven't heard of any effort in this direction.

> I've not seen anything on the mailing list so I'm guessing not.
> 
> Complicated by the need for llvm to build mesa with amdgpu. Has there 
> been any more mention of llvm beyond this post from Paul Cercueil?
> 
> http://lists.busybox.net/pipermail/buildroot/2015-February/119564.html

I'm adding Paul in Cc, to see what he intends to do with the llvm
stuff. But since he hasn't resubmitted those patches since a long long
time, I guess you can probably take over his patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
