From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 09:39:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] mpv: fix build on powerpc64 w/
 altivec
In-Reply-To: <4c8ba901042cbf0a277f38bdb80b73e8a46e8f97.1478574575.git.sam.bobroff@au1.ibm.com>
References: <4c8ba901042cbf0a277f38bdb80b73e8a46e8f97.1478574575.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161108093900.1787512a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 14:09:37 +1100, Sam Bobroff wrote:
> Fixes
> http://autobuild.buildroot.net/results/77f/77f00633b0b25f001cd4ca54ed3a12aee301c287
> 
> Add a patch to work around a name collision between bool and altivec's
> bool apparent when using sdl2.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
