From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Jun 2013 09:57:53 +0200
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <51B8EC96.8030007@mind.be> (Arnout Vandecappelle's message of
 "Wed, 12 Jun 2013 23:48:06 +0200")
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
 <20130608174904.0559f1be@skate>
 <CAHt8ZCOT2bj=-5C6Y34ULOoqV-YN74-N+hV9gYdsDBB8h8W=-w@mail.gmail.com>
 <51B8EC96.8030007@mind.be>
Message-ID: <87y5ae1lz2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> There are still build failures related to sconeserver and MySQL. See
 >>> http://autobuild.buildroot.org/results/a16/a162fbd8977faa561a76f76072ec3335fb8e8d1f/build-end.log.
 >> 
 >> I've been unable to reproduce this using the defconfig from the failed
 >> autobuild. I'm struggling to understand what exactly is causing the
 >> failures; would appreciate any suggestions that you may have...

 Arnout>  mysql.h is in $(STAGING_DIR)/usr/include/mysql, but that doesn't get
 Arnout> included in the CXXFLAGS.

 Arnout>  Peter, can you reproduce the autobuilder error and extract the
 Arnout> config.log and $(STAGING_DIR)/usr/bin/mysql_config?

Ehh, it was a build failure on Thomas' server, so it probably makes more
sense that he does it?

-- 
Bye, Peter Korsgaard
