From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 12:02:11 +0100
Subject: [Buildroot] [PATCH next 2/2] bash: bump version to 4.4
In-Reply-To: <20161129122404.59676-2-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 29 Nov 2016 12:24:04 +0000")
References: <20161129122404.59676-1-Vincent.Riera@imgtec.com>
 <20161129122404.59676-2-Vincent.Riera@imgtec.com>
Message-ID: <87inr5b58s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Notes to maintainer
 >  - This new version contains a small security fix. From
 >    http://tiswww.case.edu/php/chet/bash/NEWS:

 >    "Shells running as root no longer inherit PS4 from the environment,
 >    closing a security hole involving PS4 expansion performing command
 >    substitution."

 >    However, taking into account that bash is a critical package and the
 >    2016.11 release is very close I've marked this patch as "next".

Yes, I think that is the best approach as well.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
