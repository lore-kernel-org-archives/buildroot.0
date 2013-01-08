From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jan 2013 16:10:30 +0100
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <alpine.DEB.2.02.1301081329510.17533@www.arte.unipi.it> (Federico
 Bianchi's message of "Tue, 8 Jan 2013 13:37:10 +0100 (CET)")
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
 <alpine.DEB.2.02.1301081329510.17533@www.arte.unipi.it>
Message-ID: <87y5g3aexl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Federico" == Federico Bianchi <fbianchi@arte.unipi.it> writes:

 Federico> I faced the very same problem some time ago. When working from
 Federico> scratch, you can either build the SFTP subsystem from OpenSSH without
 Federico> installing the rest (it has very few dependencies from the main
 Federico> package) or work with rjk-sftpserver from
 Federico> http://www.greenend.org.uk/rjk/sftpserver/ - but YMMV, and I don't
 Federico> think there are any premade solutions.

Nice, wasn't aware of this sftpserver implementation. I'll add a
Buildroot package for it.

-- 
Bye, Peter Korsgaard
