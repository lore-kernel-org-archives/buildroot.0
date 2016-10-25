From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 21:58:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] rabbitmq-server: new package
In-Reply-To: <CA+-urNQbHROqF0PAyPAaVtYKEA=3RTt8ZxYRKMF6SRxahvWcuA@mail.gmail.com>
 (Frank Hunleth's message of "Tue, 25 Oct 2016 15:44:28 -0400")
References: <1477410548-9977-1-git-send-email-fhunleth@troodon-software.com>
 <87bmy8jl7m.fsf@dell.be.48ers.dk>
 <CA+-urNQbHROqF0PAyPAaVtYKEA=3RTt8ZxYRKMF6SRxahvWcuA@mail.gmail.com>
Message-ID: <8737jkjj4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

Hi,

 >> > +ExecStop=/usr/sbin/rabbitmqctl stop
 >> 
 >> How does /var/run/rabbitmq get created in the systemd case?

 > I'm actually getting skeptical that /var/run/rabbitmq really gets
 > used. I saw that it was included somewhere else, but I think it's
 > bogus. Our rabbitmq-server was originally running on a system that
 > used BusyBox init. We're in the process of converting to systemd, and
 > so far rabbitmq-server appears to be working without the directory.
 > I'll be doing more testing in the next couple weeks, and assuming
 > everything goes well, I'll send a patch up removing the
 > /var/run/rabbitmq parts.

OK, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
