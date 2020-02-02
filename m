From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2020 14:38:33 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/bitcoin: bump to version 0.19.0.1
In-Reply-To: <CADvTj4q1xNEsaU3sj5xiV+RiEF_6mHdKOVasNLkPV8KPYzr-Pw@mail.gmail.com>
 (James Hilliard's message of "Sun, 2 Feb 2020 01:42:04 -0700")
References: <20200122212637.1008692-1-fontaine.fabrice@gmail.com>
 <20200202090709.2c9afa39@windsurf>
 <CADvTj4q1xNEsaU3sj5xiV+RiEF_6mHdKOVasNLkPV8KPYzr-Pw@mail.gmail.com>
Message-ID: <87v9opnm7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

Hi,

 > Any bitcoin core updates really need to be backported as well even
 > if they are a major version bump.

 > I should probably add that there are special security considerations
 > that need to be taken into account when packaging bitcoin core.
 > See:
 > https://bitcoinmagazine.com/articles/linux-distribution-packaging-and-bitcoin-1374549783
 > https://bugzilla.redhat.com/show_bug.cgi?id=1020292

 > There are very few Linux distributions that package bitcoin core
 > as very few have a suitable release model for properly handling
 > updates. In general if a distribution can not keep Bitcoin Core on
 > the latest version for all supported releases then it really should
 > not be packaged at all.

 > One way to mitigate the risk is to explicitly remove the bitcoin core
 > package or replace it with a non-functional dummy package for
 > any stable branches where it can't be kept fully up to date. This
 > should probably be done as the final step when a stable branch is
 > no longer supported as well.

So what do you suggest? I take it that this means that you are using
bitcoin? Will you handle backports of it for our stable/lts releases?

-- 
Bye, Peter Korsgaard
