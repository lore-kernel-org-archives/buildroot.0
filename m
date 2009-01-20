From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 20:23:05 +0100
Subject: [Buildroot] What now?
In-Reply-To: <929036.64286.qm@web51306.mail.re2.yahoo.com> (Dave Tucker's
	message of "Tue\, 20 Jan 2009 10\:44\:04 -0800 \(PST\)")
References: <929036.64286.qm@web51306.mail.re2.yahoo.com>
Message-ID: <877i4pwzmu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dave" == Dave Tucker <endianx@yahoo.com> writes:

 Dave> I want to compile applications for an arm processor.  I have
 Dave> compiled Buildroot for my target platform.  How do I complile
 Dave> an application using the results of Buildroot?  It did not seem
 Dave> to produce a compiler, or if it did, I can not find it.

It should, otherwise nothing else could get build.

Have a look in build_<arch>/staging_dir/usr/bin, and use that compiler
to compile your applications.

-- 
Bye, Peter Korsgaard
