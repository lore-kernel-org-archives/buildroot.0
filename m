From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 19:43:07 +0100
Subject: [Buildroot] Synchronisation of dependencies between Config.in
	and .mk files ?
In-Reply-To: <20081027175645.7e7cb096@surf> (Thomas Petazzoni's message of
	"Mon\, 27 Oct 2008 17\:56\:45 +0100")
References: <20081027175645.7e7cb096@surf>
Message-ID: <87zlkphoas.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> However, there are great chances for these two lists of
 Thomas> dependencies for each package to become unsynchronized.

True, but I don't think there's any easy way of going from Kconfig
selects to Makefile deps.

 Thomas> What's the policy about this ? What are the current
 Thomas> techniques to keep them synchronized ?

Well, the policy is that they should be in sync - And we currently
have no way of ensuring that they are in sync besides manual review.

Do you have any ideas about how to solve this in a nicer way?

-- 
Bye, Peter Korsgaard
