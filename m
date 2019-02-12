From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:04:00 +0100
Subject: [Buildroot] [PATCH 1/2] support/testing: build a glibc
 toolchain for docker / docker-compose tests
In-Reply-To: <20190212152739.4e96f968@windsurf> (Thomas Petazzoni's message of
 "Tue, 12 Feb 2019 15:27:39 +0100")
References: <20190212131504.28231-1-peter@korsgaard.com>
 <20190212143142.0372ad03@windsurf> <874l99w0wo.fsf@dell.be.48ers.dk>
 <20190212152739.4e96f968@windsurf>
Message-ID: <875ztovnfj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 12 Feb 2019 15:12:55 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >> runc (which is a reverse dependency of docker-engine) is about to gain a
 >> >> !uclibc dependency, so move to a glibc toolchain instead.
 >> >> 
 >> >> There are currently no prebuilt x86_64 / core2 / glibc toolchains available,
 >> >> so instead use the internal toolchain backend to build one.  
 >> 
 >> > One option would be to use:  
 >> 
 >> >   https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2018.11-1.tar.bz2
 >> 
 >> Yes, I can change it to that. Do we want to use bootlin toolchains for
 >> our tests?

 > Not necessarily, I was just stating another possibility. I'm fine
 > either way.

I decided to keep it like this for now.

Committed, thanks.

-- 
Bye, Peter Korsgaard
