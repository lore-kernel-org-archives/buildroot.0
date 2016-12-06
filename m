From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 11:35:00 +0100
Subject: [Buildroot] [PATCH] sysklogd: fix build on musl
In-Reply-To: <8760mx5p1o.fsf@dell.be.48ers.dk>
References: <1480371658-31317-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <8760mx5p1o.fsf@dell.be.48ers.dk>
Message-ID: <20161206113500.1e92db7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 06 Dec 2016 11:29:07 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:  
> 
>  > This commit add a stack of small patches that make sysklogd build fine
>  > with the musl C library. Build with uClibc and glibc has been tested
>  > with those patches applied as well.  
> 
>  > The first patch is slightly rework (better description and capital
>  > letter to the title) in preparation for upstream submission.  
> 
>  > Fixes:  
> 
>  >   http://autobuild.buildroot.net/results/8fa2bf73f983330884bce2e5ac31e01dee112ba9/  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
> Committed, thanks.

Thanks!

But then you didn't wait for me to fix the inappropriate description in
the _syscall3() related patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
