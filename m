From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Sun, 20 Sep 2009 19:37:42 -0700 (PDT)
Subject: [Buildroot] [pull request] Buildroot cleanup, v2
In-Reply-To: <20090920110851.7471dde8@surf>
Message-ID: <662858.63691.qm@web58206.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--- On Sun, 9/20/09, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Subject: Re: [Buildroot] [pull request] Buildroot cleanup, v2
> To: buildroot at busybox.net
> Date: Sunday, September 20, 2009, 2:08 AM
> Hi,
> 
> Le Sat, 19 Sep 2009 17:27:51 +0200,
> Peter Korsgaard <jacmet@uclibc.org>
> a ?crit :
> 
> > Pulled and pushed - Thanks a lot!
> 
> Thanks for pulling the series and taking the risk of
> introducing such
> disruptive changes. I'm quite sure they will be some issues
> here and
> there since I obviously couldn't test the numerous ways of
> using Buildroot. But I'm quite confident that the bug
> fixing period
> will allow to fix these before the release.
> 
> Thanks,
> 
> Thomas
> -- 
Hi Thomas,

I would like to thank you and Peter for doing so much for buildroot. I completely agree with your simplifications. People who have simple needs and are just starting with buildroot should have an easy startup. People with complex multiple arch, multiple platforms should know enough to be able to do it. 

It is central to the unix philosophy in the separation of mechanism and policy. The kernel should provide mechanism, the user policy. Similarly a complete build environment should provide a mechanism and users should implement their own requirements. It should be possible to do complex things, not required for all.

Regards, Steve


      
