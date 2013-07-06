From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 06 Jul 2013 10:35:28 +0200
Subject: [Buildroot] [Hosting] Primary Prod Ganeti Cluster Hardware
	Migration & Upgrade - Jul 8-12, 2013 (Time Varies)
In-Reply-To: <CAORfjXRuN034X3wHFv-0tfL3==F1d6FbhpCziK67EmNhtN-WNg@mail.gmail.com>
 (Lance Albertson's message of "Fri, 5 Jul 2013 12:00:49 -0700")
References: <CAORfjXRuN034X3wHFv-0tfL3==F1d6FbhpCziK67EmNhtN-WNg@mail.gmail.com>
Message-ID: <8738rsjdbj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lance" == Lance Albertson <lance@osuosl.org> writes:

FYI,

Website and git will also see some downtime next week.

 Lance> Service(s) affected: All VMs hosted on our primary production
 Lance> Ganeti cluster We will be performing three tasks on the prod
 Lance> cluster:

 Lance> 1. Migration to newer hardware
 Lance> 2. Switching Node OS to CentOS 6
 Lance> 3. Upgrading Ganeti to 2.6.2

 Lance> Outage Window:
 Lance> Start: ? Mon, Jul 8, 9:00AM PDT (Mon Jul 8 1600 UTC)

 Lance> End: ? ?Fri, Jul 12, 5:00PM PDT (Sat Jul 13 0000 UTC)

 Lance> Special Note: The actual outage windows will generally happen
 Lance> during our normal business hours to ensure we get the most
 Lance> productive outcome. If you wish to have your VM migration to
 Lance> happen at a specific time, we can certainly do that even outside
 Lance> of this scheduled window. Please email me directly for that.

 Lance> I will send another email on the day of the migration with
 Lance> details on what hosts will be impacted that day and continue to
 Lance> send updates as the week progresses. We could in theory get this
 Lance> completed within a few days but we're doing a week long window
 Lance> just in case.

 Lance> Reason for outage:

 Lance> We are finally retiring some of the original Ganeti hardware in
 Lance> and moving to newer hardware which will expand our capacity
 Lance> quite a bit. We'll go from a 5-node cluster to a 6-node cluster
 Lance> with about 2-3 times more capacity.

 Lance> In addition we're going to switch the primary OS on all the
 Lance> nodes from Gentoo to CentOS 6 to offer better stability and
 Lance> lower staff time maintaining the OS.  Lastly we're finally going
 Lance> to upgrade to Ganeti 2.6.2 which will happen first.

 Lance> Projects affected: All VMs hosted on the prod cluster will
 Lance> experience a short down time at some point. Unfortunately we
 Lance> will not be able to do a live migration of the VMs since we're
 Lance> going between different versions of KVM. This means that we will
 Lance> gracefully shutdown a VM and fail it over to the newer hardware
 Lance> and start it back up.

 Lance> Please let me know ASAP if you need a specific time setup for
 Lance> your migration.

 Lance> Thank you!

 Lance> --
 Lance> Lance Albertson
 Lance> Director
 Lance> Oregon State University |?Open Source Lab?

-- 
Bye, Peter Korsgaard
