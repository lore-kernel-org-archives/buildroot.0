From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 17:17:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-10
In-Reply-To: <20180511151010.t34zuowbpldgecrb@tarshish>
References: <20180511060052.6B11C208B6@mail.bootlin.com>
 <CANQCQpaXv50gaegjR954LMBd1FLj0U3jefnG_DSVAMujzv-qWQ@mail.gmail.com>
 <20180511144826.mtmjci4ppvacqorg@tarshish>
 <20180511165756.3fa9daa8@windsurf.home>
 <20180511151010.t34zuowbpldgecrb@tarshish>
Message-ID: <20180511171721.264ba6eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 May 2018 18:10:10 +0300, Baruch Siach wrote:

> make seems to not do the right thing with -lfoo in a target dependency when 
> cross compiling. So the right solution is probably to remove these 
> dependencies. That's what the bump does. Alternatively, we can just patch -lrt 
> out of xfsprogs, and -lm out of traceroute.

OK. But why is this happening only on Matt's autobuilder ? He has a
special version of make ? He is using a Ubuntu 16.04, which seems
pretty "standard" stuff, so I'm a bit surprised here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
