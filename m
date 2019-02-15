From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Feb 2019 12:06:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-13
In-Reply-To: <20190215021300.GB25351@momiji> (Adrian Perez de Castro's message
 of "Fri, 15 Feb 2019 02:13:00 +0200")
References: <20190214070044.6825F2152B@silver.osuosl.org>
 <20190214100244.GB15212@momiji> <20190214093947.3949384d@windsurf>
 <20190215021300.GB25351@momiji>
Message-ID: <87a7ixgvkd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Yes, if the issue no longer happens with gcc >= 7.x, it seems like a
 >> reasonable option.

 > At this point I don't know what to do; I don't see any proposed patch to
 > apply to GCC, and I never touched Microblaze before.

 > I guess disabling the Brotli package for Microblaze wouldn't be an option...
 > or would it?

If it doesn't build, then that is IMHO the only sensible thing to
do. Given that brotli has very few reverse dependencies (and there is
probably no realistic usecase for webkit on microblaze) it is OK.

Will you send a patch?

-- 
Bye, Peter Korsgaard
