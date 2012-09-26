From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Sep 2012 10:35:49 +0200
Subject: [Buildroot] Host xmllint dynamic link failure
In-Reply-To: <20120926102431.01356fc9@skate> (Thomas Petazzoni's message of
 "Wed, 26 Sep 2012 10:24:31 +0200")
References: <50624463.1000200@mind.be> <20120926093025.0ba0c3d0@skate>
 <5062BA88.3000906@mind.be> <5062BB53.8030808@mind.be>
 <20120926102431.01356fc9@skate>
Message-ID: <87ehlp6v16.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Arnout Vandecappelle,
 Thomas> On Wed, 26 Sep 2012 10:22:43 +0200, Arnout Vandecappelle wrote:

 >> Actually that's a third workaround (which just hides the
 >> problem :-): we currently don't have --disable-doc in the configure
 >> of host-packages.  I don't think we really need to build the docs for
 >> host packages, do we?

 Thomas> We certainly don't, I'd say.

Agreed, and also for the new libX11.

-- 
Bye, Peter Korsgaard
