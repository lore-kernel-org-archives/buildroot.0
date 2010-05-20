From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 May 2010 21:25:56 +0200
Subject: [Buildroot] gettext libglib2 issues & uclibc 0.9.31
In-Reply-To: <C9ED41478C3D404FA1130981ED65FD13@apexjs> (Sagaert Johan's
	message of "Thu, 20 May 2010 19:45:51 +0200")
References: <C9ED41478C3D404FA1130981ED65FD13@apexjs>
Message-ID: <87k4qywf23.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> I noticed that a lot of these problems appear when i use uclibc 0.9.31
 Sagaert> I enabled many of the old stuff but some things still seem to cause trouble.
 Sagaert> (missing res_query )
 
 Sagaert> Anyone else  having trouble when using uclibc 0.9.31 ?

I just did a testbuild with 0.9.31, wchar and libglib2 without problems
on x86-64 and arm.

-- 
Bye, Peter Korsgaard
