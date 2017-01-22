From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Jan 2017 22:07:21 +0100
Subject: [Buildroot] [PATCH] ruby: bump version to 2.4.0
In-Reply-To: <871sw7asxn.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 13 Jan 2017 16:19:32 +0100")
References: <20170109171403.57632-1-Vincent.Riera@imgtec.com>
 <871sw7asxn.fsf@dell.be.48ers.dk>
Message-ID: <87lgu24xdi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
 >> The problem addressed by 0001 patch has been fixed upstream and is that
 >> fix is included in this release:
 >> https://github.com/ruby/ruby/commit/aa107497cd379b713eba8cecdb9a882bb1e0dd89

 >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

 > Committed, thanks.

This seems to cause a number of build issues. Care to take a look?

http://autobuild.buildroot.net/?reason=ruby-2.4.0

-- 
Bye, Peter Korsgaard
