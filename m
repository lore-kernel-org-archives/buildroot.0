From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 06 Jul 2013 10:32:55 +0200
Subject: [Buildroot] [Hosting] Migrating ash (mailman, ticket tracking,
	imap, shell server) to a VM - Jul 8,
	2013 5:00PM PDT (Jul 9 2013 0000 UTC)
In-Reply-To: <CAORfjXTabfgCw=KANg3Te42TAB2=oM7h3kxhuvWRJVT2xF3L3g@mail.gmail.com>
 (Lance Albertson's message of "Fri, 5 Jul 2013 12:13:26 -0700")
References: <CAORfjXTabfgCw=KANg3Te42TAB2=oM7h3kxhuvWRJVT2xF3L3g@mail.gmail.com>
Message-ID: <877gh4jdfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lance" == Lance Albertson <lance@osuosl.org> writes:

FYI,

The mailing list will have a short downtime on Monday.

let me know if something isn't working afterwards.


 Lance> Service(s) affected: All mailman instances on our shared
 Lance> instance, all OSL mail delivery, RT (ticket tracking) and OSL
 Lance> Shell access.

 Lance> All mail will be queued up while the outage occurs.?

 Lance> Outage Window:
 Lance> Start: ? Mon, Jul 8, 5:00PM PDT (Tue Jul 9 0000 UTC)

 Lance> End: ? ?Mon, Jul 8, 7:00PM PDT (Tue Jul 9 0200 UTC)

 Lance> Reason for outage:

 Lance> The hardware that hosts mailman, our mail store and shell is
 Lance> aging and?desperately?needs to be on better hardware. In
 Lance> additional we're running out of disk space on the machine and
 Lance> can more easily manage that grow in a virtualizied
 Lance> environment. I expect the actual outage to last around one hour
 Lance> while we wait for a final sync of the data to the VM.

 Lance> We will likely have another outage on this host later in the
 Lance> summer to switch it to CentOS 6 but this migration is literally
 Lance> just an rsync to get it on newer hardware.

 Lance> Projects affected: All shared mailman instances on ash and OSL
 Lance> staff.

 Lance> --
 Lance> Lance Albertson
 Lance> Director
 Lance> Oregon State University |?Open Source Lab?

-- 
Bye, Peter Korsgaard
