From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jun 2018 22:00:26 +0200
Subject: [Buildroot] [Hosting] Unplanned outage: Hypervisor issue with
 gprod1 on primary Ganeti cluster
In-Reply-To: <CAORfjXRQca2cn+UhOL1_dCG8Ki2VZG-hN0jRONJKci8EVAZ_NQ@mail.gmail.com>
 (Lance Albertson's message of "Wed, 13 Jun 2018 07:48:29 -0700")
References: <CAORfjXRQca2cn+UhOL1_dCG8Ki2VZG-hN0jRONJKci8EVAZ_NQ@mail.gmail.com>
Message-ID: <87tvq64ftx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lance" == Lance Albertson <lance@osuosl.org> writes:

FYI,

If you had issues accessing sources.buildroot.{net,org} today, this was
most likely the reason.

The machine is up and running again.

 > All,
 > At approximately 2:36AM PDT (0900 UTC), one of the hypervisors (gprod1) in
 > our primary Ganeti cluster started having hardware issues. This took down
 > all of the instances running on that node. I attempted to bring the node
 > back online however the hardware issue prevented it to come back online. At
 > that point I failed all of the VM instances over to their secondary nodes
 > and forced another node to become the Ganeti master (since gprod1 WAS the
 > master). All of the instances were back online by around 7:40AM PDT (1400
 > UTC).

 > Everything at this point seems to be back to normal (except for gprod1). I
 > will look into bringing gprod1 back online later today.

 > Thank you and sorry for the outages this caused.

 > -- 
 > Lance Albertson
 > Director
 > Oregon State University | Open Source Lab

-- 
Bye, Peter Korsgaard
