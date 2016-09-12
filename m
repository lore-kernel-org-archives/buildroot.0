From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 12 Sep 2016 06:47:06 +0000
Subject: [Buildroot] [PATCH] pugixml: new package
In-Reply-To: <2c1fa8e0-f670-3b5d-a5b8-748034f23cdb@mind.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
 <1473262627-14429-2-git-send-email-theo.debrouwere@skynet.be>
 <20160911230830.0bc783a5@free-electrons.com>
 <20160911215627.fuqvlcqo4rh67uc3@skynet.be>
 <2c1fa8e0-f670-3b5d-a5b8-748034f23cdb@mind.be>
Message-ID: <1473662826.32535.28.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, 2016-09-12 at 00:15 +0200, Arnout Vandecappelle wrote:
> 
> On 11-09-16 23:56, Theo Debrouwere wrote:
> > 
> > Hello,
> > 
> > > 
> > > This new package is causing a number of build failures. See:
> > > 
> > > ? http://autobuild.buildroot.net/?reason=pugixml-1.7
> > > 
> > > Could you have a look?
> > 
> > 
> > The bfin issues seems to be caused by a fault in the CMakelist.txt file.
> > Which seems to have been solved in the upstream git repo.
> > I will test the fix & verify that it solves the issue.
> > 
> > If it does, I'll provide the fix as a patch on 1.7, unless you/someone
> > else prefers bumping to an unreleased git commit.
> 
> ?No, better cherry-pick the patch. If the upstream patch can be applied as-is,
> we prefer pointing PUGIXML_PATCH to the upstream commit (and adding it to the
> hash file) rather than saving a copy in buildroot.
> 
> > 
> > 
> > 
> > The arc issue: the compiler complains about an internal error.
> > I'm not sure if this is a pugimxl issue, but I'll reproduce it
> > tomorrow. (currently building bfin)
> 
> ?Compiler errors on ARC are handled pretty quickly by the ARC team. Just to be
> sure, I'm adding Vlad in Cc.
> 
> 
> ?Regards,
> ?Arnout
> 
> > 
> > 
> > 
> > 
> > Theo
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 

We know about that ARC compiler issue and working on it.?
I hope we will provide a fix soon.?

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
