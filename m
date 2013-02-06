From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 00:48:02 +0100
Subject: [Buildroot] Fwd: bug report: c++ programs built by toolchain
 crash by seg fault
In-Reply-To: <CAJXWAwwUdgS0DSGAvojfbZfZpxr9ZpGvM8+ojvAsSy0WSV85Zw@mail.gmail.com>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
 <20130205084502.6b370422@skate>
 <CAJXWAwzg3iPu6qW+E560nw=fQZ6=UMhNAkTGhbaoCnFbcfQdzQ@mail.gmail.com>
 <CAJXWAwwUdgS0DSGAvojfbZfZpxr9ZpGvM8+ojvAsSy0WSV85Zw@mail.gmail.com>
Message-ID: <5112EBB2.7060409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/13 11:15, hayate wrote:
> It's a personal reason, because I have an old system that I cannot
> upgrade.

  If you're using buildroot, you're basically upgrading your system, 
right?  Or are you just using buildroot to create a compiler?


> But since it's an explicit option there in buildroot still, I
> think it may be a defect.

  True. We should deprecate OABI.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
