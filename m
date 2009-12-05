From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 5 Dec 2009 02:59:22 -0600
Subject: [Buildroot] [RFC:bugzilla] Addition of Category "Test Report"
Message-ID: <200912050259.25672.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Would someone please add the category "test report" to "Severity"?

There is an unlikely but still small chance it might get used.
It certainly will not get used if it isn't there.  ;)

Example situation:

The MIPS core M14K<qualifier>, first documented in July, 2009 is not 
mentioned in the pre-release documentation for GCC-4.5 nor is the 
feature (microMIPS) first mentioned in the core's documentation.

The only way to find out the current status will be to build
the gcc-snapshot from time to time and check it for specific
support of the core.

For the moment (not yet tested the snapshot) the user-visible comment
will have to say "gcc support not determined REF: <something>"
It would be nice to have a bugzilla tracking number to put in the <something>.

Mike
