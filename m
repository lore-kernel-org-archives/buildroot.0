From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 23:49:25 +0100
Subject: [Buildroot] [PATCH 1/1] utils/getdeveloperlib.py: fix issue
 with hasfile()
In-Reply-To: <20201113140627.6097-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Fri, 13 Nov 2020 15:06:27 +0100")
References: <20201113140627.6097-1-heiko.thiery@gmail.com>
Message-ID: <87zh3fy4y2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > pkg-stats is not able anymore to set the developers for defconfigs and
 > packages. This issue is introduced with
 > ae86067a151b6596ca492d6f94ed513f4f8e18d7. The hasfile() method from
 > Developer object tries to check an absolute path against a relative path.

 > Convert the filepath to be checked also into an absolute path.

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I know that Thomas has some pending patches to clean this up more, but
this is a trivial change and fixes the immediate issue, so committed,
thanks.

-- 
Bye, Peter Korsgaard
