From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 15:05:26 +0200
Subject: [Buildroot] [PATCH 1/3] perl: bump to version 5.20.1
In-Reply-To: <CAB0FRsvNwxtLpSH61AexhRG7_FKXqAOZwV9wPQ-uDA4i+OecRA@mail.gmail.com>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
 <20141004142612.7d164eee@free-electrons.com>
 <CAB0FRsvNwxtLpSH61AexhRG7_FKXqAOZwV9wPQ-uDA4i+OecRA@mail.gmail.com>
Message-ID: <20141004150526.70580ed2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Sat, 4 Oct 2014 14:52:10 +0200, Fran?ois Perrad wrote:

> > Don't know if it's related to the version bump, but perl now fails to
> > build on PowerPC:
> >
> >   http://autobuild.buildroot.org/results/8ad/8ade6c432ffa725a324f9e7cfb18f6453687b129/build-end.log
> >
> > Could you have a look?
> >
> 
> I've already filled an issue, see https://github.com/arsv/perl-cross/issues/10

Ok, thanks. Do you think the perl-cross people will be reactive? If
not, what do we do in the mean time: revert the bump? Disable perl on
big-endian architectures?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
