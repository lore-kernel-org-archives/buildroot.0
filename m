From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Mar 2012 08:06:03 +0100
Subject: [Buildroot] [PATCH 2/2] Add test infrastructure
In-Reply-To: <20120305145625.GE21255@game.jcrosoft.org>
References: <1330818307-22115-1-git-send-email-arnout@mind.be>
 <1330818307-22115-3-git-send-email-arnout@mind.be>
 <20120305145625.GE21255@game.jcrosoft.org>
Message-ID: <201203060806.03919.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 March 2012 15:56:25 Jean-Christophe PLAGNIOL-VILLARD wrote:
>         I like the idea of test but what is the target here?

 Good point, I should have explained that.

 Currently, ThomasP and Peter are both independently running tests on the 
buildroot tree.  We would like to have more testing done.  I myself have a
server available that can do continuous testing.  However, a single 
buildbot isn't going to cut it, because it takes quite long to build a
single configuration.  Therefore, I would like to put test infrastructure
in the buildroot repository so others can easily set up their own buildbot.

 Another part of this evolution will be to set up a webpage where test
results can be posted and retrieved.  Peter was going to do that (but 
hasn't had the time yet).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
