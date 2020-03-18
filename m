From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 21:52:16 +0100
Subject: [Buildroot] [PATCH v3 5/5] DEVELOPERS: add me as a
 co-maintainer for rk3399 based targets
In-Reply-To: <CAMty3ZBU8AP8SEuQC95eRELA5XZa2Dr92Efj3e3FENW24BiPfA@mail.gmail.com>
References: <1581590685-31680-2-git-send-email-sunil@amarulasolutions.com>
 <1584539153-12934-1-git-send-email-sunil@amarulasolutions.com>
 <1584539153-12934-6-git-send-email-sunil@amarulasolutions.com>
 <CAEyMn7aO8gmKywpsYxY+cAqsUGiL=oW9CfiZwtVi9L76-6us1A@mail.gmail.com>
 <CAMty3ZBU8AP8SEuQC95eRELA5XZa2Dr92Efj3e3FENW24BiPfA@mail.gmail.com>
Message-ID: <20200318215216.187d07bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

On Wed, 18 Mar 2020 22:37:30 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> Doesn't it have a possibility of co-developer concept in buildroot
> like we do have linux maintainers file? I feel it makes sense to have
> it or the goal of this DEVELOPERS file seems different as what we
> think?

The Linux MAINTAINERS file and the Buildroot DEVELOPERS are organized
differently.

The Linux MAINTAINERS file is organized by topic/subsystem, and gives
for this subsystem the list of persons in charge of it.

The Buildroot DEVELOPERS is organized by person, and gives for each
person the list of packages/defconfigs/areas this person is interested
in.

It is unlikely that two different developers will have exactly the same
set of packages/defconfigs/areas they are interested in, so we don't
support having multiple name/e-mail in front of a single list of
packages/defconfigs. In addition, that would break the alphabetic
ordering of the file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
