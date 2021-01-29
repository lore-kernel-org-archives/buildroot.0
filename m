From: manu f <e.fiancette@gmail.com>
Date: Fri, 29 Jan 2021 13:09:28 +0100
Subject: [Buildroot] No rule to make target 'host-python !! [SOLVED]
In-Reply-To: <20210125150524.2e40fd93@windsurf.home>
References: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
 <CAGshWo1eWoWDUd_0jD8xQbpZg7dGzOzhwNeNmhrc5ewh9z6TSQ@mail.gmail.com>
 <20210123114813.0f7048c2@windsurf.home>
 <CAGshWo2ngucacs+BJocUb36G4QX7Q7ssv2_M0R9kAiV+oick1Q@mail.gmail.com>
 <20210124161440.52c2d7d6@gmx.net>
 <CAGshWo31-JML-C6D+T+Bbp8QrsWKZhE2r4-N8HaOAp6z4rkhtQ@mail.gmail.com>
 <20210124173940.29212b62@gmx.net>
 <CAGshWo2TRnTguBc3inO23idP2kMjnXzXeBaOsx=s_jWmh3ddhg@mail.gmail.com>
 <20210124225357.12a7e17e@gmx.net>
 <CAGshWo3WX8zmkfbCFTW-D+Q=LAYHm52W_qFOSQE+jw-NQsdEcA@mail.gmail.com>
 <CAGshWo2+Zq9DutPd27rbJbgs+5X=VrK-3_Wo72GXwc57QmyGpA@mail.gmail.com>
 <20210125150524.2e40fd93@windsurf.home>
Message-ID: <CAGshWo0a1oRSvFw-4FXvm+YrhAX4yBthWp40VPL15pO2gExzog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Nothing very tricky in my BR2_EXTERNAL, unnecessary certainly !
I am in learning  curve so I think unnecessary things is inherent and
necessary :-)

But, well, I clone again from scratch my buildroot directory and no more
error !
it is the mystery of computing. ;-)
Thanks for your help, i learn a lot.

Regards

Le lun. 25 janv. 2021 ? 15:05, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> Hello,
>
> On Mon, 25 Jan 2021 13:40:13 +0100
> manu f <e.fiancette@gmail.com> wrote:
>
> > Well, I remove my python37 package, delete my output directory, select
> > python3 package from buildroot and host python3 in host utilities  from
> > buildroot and ...
>
> Please stop using your custom BR2_EXTERNAL for the moment, and use plain
> Buildroot, and verify there if this works.
>
> If it does, then the problem is in your BR2_EXTERNAL tree. We cannot
> debug problems that are caused by your custom BR2_EXTERNAL, in which
> you're doing things that are very tricky and/or apparently unnecessary.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210129/7857ee11/attachment.html>
