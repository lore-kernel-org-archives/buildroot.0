From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:52:50 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <20170920112825.3971-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 20 Sep 2017 13:28:25 +0200")
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
Message-ID: <87fubhxnnx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > It seems github now sometimes provides slightly changed tarballs which
 > produce a different sha256 hash than before. Fix the hashes of the
 > affected packages to avoid downloading from sources.buildroot.net.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

:/

I'm not sure updating the hashes is the correct thing to do. Sources.b.o
runs 'make source' from the 2017.02.x and master branches to keep it
uptodate, and E.G. freerdp hasn't been updated since 2017.02, so it will
break hard for 2017.02.x users if we change it.

Falling back to s.b.o is not such a bad thing, so I think we can wait
with fixing up the hashes until the packages get bumped.

In the mean time I will try to figure out who to contact at github to
ask about the change.

-- 
Bye, Peter Korsgaard
