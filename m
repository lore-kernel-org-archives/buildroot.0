From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 16:13:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
In-Reply-To: <CANabuZfN6X33VpRN6NX4J2ZgTGY9NT1fMvUMaZa9-h0ZYqPWaQ@mail.gmail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201205222153.75769040@windsurf.home>
 <CANabuZeh=hZ6sUdq-2NOnt7AnS70bmb=ZQkxemFKuHc3-AtiyA@mail.gmail.com>
 <CANabuZfN6X33VpRN6NX4J2ZgTGY9NT1fMvUMaZa9-h0ZYqPWaQ@mail.gmail.com>
Message-ID: <20201229161304.2ab04345@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Dec 2020 16:03:18 +0100
Andreas Hilse via buildroot <buildroot@busybox.net> wrote:

> Joachim is the maintainer/developer of sysklogd. He already integrated the
> newer sysklogd as an external package in his project "netbox":
> https://github.com/westermo/netbox/tree/master/package/sysklogd2
> The mentioned bug also has been fixed already by him (but not in a release).
> For my correspondence with Joachim please refer to
> https://github.com/troglobit/sysklogd/issues/24
> 
> Would it be useful for buildroot users to have the choice between the old
> and the new version of sysklogd?

Well, in this very thread, you simply bumped the sysklogd package to
this new 2.x version, which is fine for me. There were just a few
issues to resolve, but other than that on the principle, I'm fine with
package/sysklogd simply using the 2.x version of the project.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
