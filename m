From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Feb 2012 12:05:32 +0100
Subject: [Buildroot] [PATCH 3/3] .gitignore: remove wrong entries
In-Reply-To: <CAMP44s10qfDsyg69vHqsR-Lu3V9uJoJH6AY46xETJ=T-ijhxQA@mail.gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LXsQCsdwswHGa=Ei-+DkB7OyJbKnz7MhatTeEgCk5MMWw@mail.gmail.com>
 <CAMP44s10qfDsyg69vHqsR-Lu3V9uJoJH6AY46xETJ=T-ijhxQA@mail.gmail.com>
Message-ID: <201202121205.32861.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 12 February 2012 00:01:51 Felipe Contreras wrote:
> > I'm neutral on the .patch and .diff change, but I think that .depend, .o,
> > .orig, .rej and ~ backups should remain in .gitignore.
> 
> *.o and *.depend should be there, as they are the output of the build system.

 No they're not.  Maybe in a far and distant past, but now (almost) all
output is in the output directory.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
