From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 15:18:25 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <485B6CF6.7040901@cetrtapot.si> (Hinko Kocevar's message of "Fri\,
	20 Jun 2008 10\:40\:22 +0200")
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
Message-ID: <87tzfo8cta.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:

Hi,

 Hinko> I've been looking for recent gcc for the cris arch as I was
 Hinko> seeing gcc internal errors when compiling kernel or openssl
 Hinko> source with gcc 4.2.3 or 4.2.4.  With gcc 4.3.1 gcc internal
 Hinko> errors went away, so I'm really glad I found the GIT tree!

Notice that 4.3.1 also has issues (on i686 atleast):

http://kerneltrap.org/Linux/Compiler_Oops

-- 
Bye, Peter Korsgaard
