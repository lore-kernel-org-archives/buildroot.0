From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Nov 2010 13:48:00 +0100
Subject: [Buildroot] Results of random configuration builds
In-Reply-To: <20101106134454.7769d258@surf> (Thomas Petazzoni's message of
	"Sat, 6 Nov 2010 13:44:54 +0100")
References: <20101106134454.7769d258@surf>
Message-ID: <871v6y39fj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> I've run a few random build tests yesterday, and analyzed the results a
 Thomas> bit today. I've set up a small webpage that gathers the results,
 Thomas> together with the logfile and the configuration for each test.

 Thomas> See http://free-electrons.com/~thomas/pub/buildroot-logs/

Thanks, I also have a bunch of build logs on gcc10.fsffrance.org

 Thomas> Most of the builds are failing. The worst problem is that libglib2 does
 Thomas> not build in many situations (see
 Thomas> http://free-electrons.com/~thomas/pub/buildroot-logs/test-195/logfile-end).
 Thomas> There are also problems with logrotate, gvfs, libgcrypt, olsr, libmad,
 Thomas> netperf, magiccube4d, libmpeg2, xfsprogs, imagemagick, squid, ltrace,
 Thomas> tcpdump, bash, gmp, gdb.

 Thomas> It'd be great if some of the readers of this list could have a look at
 Thomas> one or several of these build problems, so that we can collaboratively
 Thomas> solve them.

I've noticed the tcpdump issue as well, and I'm fixing that now.

-- 
Bye, Peter Korsgaard
