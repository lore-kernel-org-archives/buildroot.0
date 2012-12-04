From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 04 Dec 2012 12:23:49 -0800
Subject: [Buildroot] [git commit] package: add classpath
In-Reply-To: <20121204204349.15ee9b81@skate> (Thomas Petazzoni's message of
 "Tue, 4 Dec 2012 20:43:49 +0100")
References: <20121204190928.0DF9899716@busybox.osuosl.org>
 <20121204204349.15ee9b81@skate>
Message-ID: <87obi9muqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Requires java, javac and jar on the build machine, similar to how we
 >> require gcc/g++.

 Thomas> So, it needs additional checks in support/dependencies/dependencies.sh
 Thomas> I guess.

Which I have added ;)

 >> classpath: fixup

 Thomas> Doh ? :-)

Argh!

-- 
Bye, Peter Korsgaard
