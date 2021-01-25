From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 15:05:24 +0100
Subject: [Buildroot] No rule to make target 'host-python !!
In-Reply-To: <CAGshWo2+Zq9DutPd27rbJbgs+5X=VrK-3_Wo72GXwc57QmyGpA@mail.gmail.com>
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
Message-ID: <20210125150524.2e40fd93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jan 2021 13:40:13 +0100
manu f <e.fiancette@gmail.com> wrote:

> Well, I remove my python37 package, delete my output directory, select
> python3 package from buildroot and host python3 in host utilities  from
> buildroot and ...

Please stop using your custom BR2_EXTERNAL for the moment, and use plain
Buildroot, and verify there if this works.

If it does, then the problem is in your BR2_EXTERNAL tree. We cannot
debug problems that are caused by your custom BR2_EXTERNAL, in which
you're doing things that are very tricky and/or apparently unnecessary.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
