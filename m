From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 23:08:21 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <CADYdroOZp=M3DCYtE1gi-n7H1QAYtvZWxUb7Jop8LbY_DgKN9w@mail.gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
 <20191016154850.0d093c4d@windsurf>
 <CADYdroMp8GzXS+zQ0a+T-eeqDiMggbybn+gu6H4Y2x-d4GTkdA@mail.gmail.com>
 <20191016210129.4043da12@windsurf.home>
 <20191016201610.GG14656@scaer>
 <CADYdroOZp=M3DCYtE1gi-n7H1QAYtvZWxUb7Jop8LbY_DgKN9w@mail.gmail.com>
Message-ID: <20191016230821.219cf441@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Wed, 16 Oct 2019 22:31:24 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > So yes, ther are situations where using a system-provided meson _may_
> > work, but the generic case is that our patch is still required to ensure
> > that the situatiuon dexribed above still works.  
> 
> Yes, you want to be able to build all packages in buildroot without issues.
> My patch would not change that. You would need to set an variable
> override to pick up the system meson/ninja.

We don't want to have this code that is basically "dead" (because it can
only be enabled by tweaking those variables in the environment).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
