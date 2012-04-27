From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 23:54:57 +0200
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <20120427005558.GA20161@game.jcrosoft.org>
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <20120426164511.2f6e462d@skate> <20120427005558.GA20161@game.jcrosoft.org>
Message-ID: <201204272354.58069.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 April 2012 02:55:58 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > No, that's not what we do for all other packages. Gustavo's patch is
> > correct with regard to the current guidelines.
> > 
> > Now, whether we should change those guidelines to something else is a
> > different story. But if we change the guideline, it should be changed
> > for all packages and not just for lsof.
> package/kmod/Config.in is already like this
> 
> and it's more clean

 I agree that it's better to do it in the package's Config.in.

 And changing the guideline doesn't automatically mean that all
packages have to change.  Only new packages (or patches) must follow 
the guideline.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
