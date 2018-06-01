From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jun 2018 14:24:01 +0200
Subject: [Buildroot] qt-4.8.7 ICE on powerpc [was:
 [autobuild.buildroot.net] Build results for 2018-05-31]
In-Reply-To: <bd26e178-b204-056d-3646-7ececd9964d5@mind.be>
References: <20180601060027.2921620828@mail.bootlin.com>
 <a3c7791c-7502-5ce2-9677-355105fd23ec@mind.be>
 <20180601110638.5c41eacf@windsurf>
 <bd26e178-b204-056d-3646-7ececd9964d5@mind.be>
Message-ID: <20180601142401.63697c3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Jun 2018 13:12:56 +0200, Arnout Vandecappelle wrote:

> > On Fri, 1 Jun 2018 09:58:01 +0200, Arnout Vandecappelle wrote:  
> >> On 01-06-18 08:00, Thomas Petazzoni wrote:  
> >>>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cebd1d3d013d40bf71bf20696c28818f58d9533a | ORPH    
> >>
> >>  This one has also been failing for a *long* time. It is caused by
> >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818  
> > 
> > Doesn't this bug report claims that the issue has been fixed in gcc
> > 6.x... but still the autobuild failure happens with a gcc 6.x based
> > toolchain ?  
> 
>  Well, a single bug report sometimes contains multiple bugs :-). Apparently part
> of the problem was only fixed in GCC7.2, and it's possible that some part is not
> fixed yet.

If a single bug report contains multiple bugs, then our
BR2_TOOLCHAIN_GCC_HAS_BUG_xyz naming has a serious problem :-)

Is this specific Qt4 issue resolved with gcc 7.x ? Some testing on this
would be nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
