From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Aug 2012 22:58:30 +0200
Subject: [Buildroot] Custom kernel with git
In-Reply-To: <8F452AD7563B864F966F95FF2A46BC37224084B4@ECS-EXG-P-MB03.win.lanl.gov>
References: <8F452AD7563B864F966F95FF2A46BC37224084B4@ECS-EXG-P-MB03.win.lanl.gov>
Message-ID: <503A8DF6.1040604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/17/12 20:20, Pickett, Neale T wrote:
> I'm having trouble getting the 2012.08-rc2 to build a custom kernel from git.  I had trouble with rc1 also.  What am I doing wrong?
>
> crazyharry:/home/neale/src/buildroot-2012.08-rc2$ grep GIT .config
> BR2_GIT="git clone"

  You must have found out by now, but in the off chance you didn't:
BR2_GIT should be just git, not "git clone".  The "clone" is added by
buildroot.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
