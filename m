From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 22:21:56 +0200
Subject: [Buildroot] [PATCH 3/5] pkg-download: allow ssh URLs
In-Reply-To: <20160616194024.GF32532@hermes.click-hack.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-3-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160615230808.4c1e063b@free-electrons.com>
 <20160616194024.GF32532@hermes.click-hack.org>
Message-ID: <20160616222156.6067dd6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 21:40:24 +0200, Gilles Chanteperdrix wrote:

> > """
> > What about Hg URLs that can also start with 'ssh://' ?
> > """
> > 
> > Indeed, I don't see why a ssh:// URL should necessarily reference a Git
> > repository. And there's no explanation about this decision in the
> > commit log.  
> 
> See the discussion here:
> http://lists.busybox.net/pipermail/buildroot/2016-May/160670.html

I might be missing something, but I don't see anything in this
discussion that gives a justification as to why ssh:// in Buildroot
should always mean "git over ssh" and not potentially "mercurial over
ssh" or "subversion over ssh".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
