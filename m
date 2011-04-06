From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Apr 2011 22:23:30 +0200
Subject: [Buildroot] procps fails to compile on Fedora 14 due to newer
	version of GNU make
In-Reply-To: <AANLkTinvmWA5EWv+98t=YqasMOmxg4pusJgD4SQ7ayUV@mail.gmail.com>
	(bruce bushby's message of "Fri, 18 Mar 2011 11:16:39 +0000")
References: <AANLkTinvmWA5EWv+98t=YqasMOmxg4pusJgD4SQ7ayUV@mail.gmail.com>
Message-ID: <877hb7w2m5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bruce" == bruce bushby <bruce.bushby@gmail.com> writes:

 bruce> Hi

 bruce> I recently switched to Fedora 14 as my build platform and picked
 bruce> up a problem compiling procps. This is apparently caused by
 bruce> newer versions of make.

 bruce> Previously I was building on ubuntu "natty" which has
 bruce> "make-3.81-8" ... however Fedora 14 is using
 bruce> "make-3.82-2". There is a very nice explanation here:
 bruce> http://old.nabble.com/make-3.81.91---procps-3.2.8-td29281048.html

 bruce> Where Paul Smith explains:
 bruce> In previous versions of GNU make, wildcards were returned in sorted?
 bruce> order; however that was never guaranteed and the new version of make?
 bruce> (for efficiency) returns matches in "directory order", which is?
 bruce> essentially random.

Fixed in git (together with the bump to 3.2.8) - Thanks.

-- 
Bye, Peter Korsgaard
