From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 16:55:01 +0100
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
In-Reply-To: <52AF2051.7080806@imgtec.com> (Vicente Olivert Riera's message of
 "Mon, 16 Dec 2013 15:46:25 +0000")
References: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
 <871u1i2lhm.fsf@dell.be.48ers.dk> <52AA38BC.2020407@mind.be>
 <87bo0l1y5p.fsf@dell.be.48ers.dk> <52AAD485.5040306@imgtec.com>
 <87haadyswh.fsf@dell.be.48ers.dk> <52AF10A4.6050609@imgtec.com>
 <87bo0gsu9g.fsf@dell.be.48ers.dk> <52AF2051.7080806@imgtec.com>
Message-ID: <871u1cssdm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 > But you need to mirror it first. The version we have right know works
 > because you have this tarball in the buildroot mirrors:
 > http://sources.buildroot.net//knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz

 > If you try to get that file from git, it fails with:
 >>>> knock 7666f2e86e18d482eaad5fe1fea46d87d80b0555 Downloading
 > --2013-12-16 15:40:52-- 
 > https://github.com/jvinet/7666f2e86e18d482eaad5fe1fea46d87d80b0555/tarball/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz
 > Resolving github.com... 192.30.252.130
 > Connecting to github.com|192.30.252.130|:443... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2013-12-16 15:40:53 ERROR 404: Not Found.

 > So, in order to bump the version you need to put the new tarball in
 > the mirrors first.

Ahh, I somehow dropped the project name ('knock') from the github macro
when I fixed the revision.

Sorry about that, fixed in git.

 > -- 
 > Vincent



-- 
Bye, Peter Korsgaard
