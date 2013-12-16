From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 16:14:19 +0100
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
In-Reply-To: <52AF10A4.6050609@imgtec.com> (Vicente Olivert Riera's message of
 "Mon, 16 Dec 2013 14:39:32 +0000")
References: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
 <871u1i2lhm.fsf@dell.be.48ers.dk> <52AA38BC.2020407@mind.be>
 <87bo0l1y5p.fsf@dell.be.48ers.dk> <52AAD485.5040306@imgtec.com>
 <87haadyswh.fsf@dell.be.48ers.dk> <52AF10A4.6050609@imgtec.com>
Message-ID: <87bo0gsu9g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 >> > Yes, I sent a pull request upstream and they merged it. If you have
 >> > updated the knock.mk to use the latest git, then we don't need any
 >> > patch because it's already applied upstream :-)
 >> 
 >> True, but the same applies with the current version we're using as that
 >> is from before the README -> README.md rename.

 > Oh, I understand now... You changed the git version of this package to
 > downgrade it just to the point before the README -> README.md was
 > made.

Well, that's one way of seeing it - I fixed it to use the version
specified (7666f2e86e18d4), which was presumably what was the submitter
had desired. Before that fix it used the current head (first time the
package was built, afterwards the local tarball in dl/ is used).


 >> If you have tested the latest git then you are welcome to send a patch
 >> bumping the version.

 > Yes, I have tested it, but it's easier for you to just change the
 > version to the last git commit number.

Do you mind sending a patch changing KNOCK_VERSION so you can sign off
on it? Thanks.

-- 
Bye, Peter Korsgaard
