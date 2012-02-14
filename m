From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 17:18:35 +0100
Subject: [Buildroot] [git commit branch/next] Makefile: use
	/etc/os-release for version info rather than /etc/br-version
In-Reply-To: <4F3A86D8.5010605@lucaceresoli.net> (Luca Ceresoli's message of
 "Tue, 14 Feb 2012 17:07:52 +0100")
References: <20120214121000.DDC1090A9E@busybox.osuosl.org>
 <4F3A86D8.5010605@lucaceresoli.net>
Message-ID: <87obt1v15w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 >> NAME=Buildroot
 >> VERSION=2012.02-rc1-00003-g2d10e81
 >> ID=buildroot
 >> VERSION_ID=2012.02-rc1
 >> PRETTY_NAME="Buildroot 2012.02-rc1"

 Luca> Nice.
 Luca> I just wish PRETTY_NAME had at least a "-dirty" suffix to make it
 Luca> clear that it is not exactly equal to 2012.02-rc1 (at least when using
 Luca> a git clone).

We can make it use BR2_VERSION_FULL, but I didn't find that particulary
"pretty". I normally change the version string to <versionN+1>-git right
after a release, so it's only between -rc1 and the final release that
there can be a bit of confusion (and you always have VERSION to figure
it out).

-- 
Bye, Peter Korsgaard
