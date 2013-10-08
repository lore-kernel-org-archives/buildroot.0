From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Oct 2013 23:19:06 +0200
Subject: [Buildroot] [PATCHv3 02/20] glibc: fix glibc build by creating
	an empty gnu/stubs.h
In-Reply-To: <1381256237-27948-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:16:59 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871u3v5ulx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The stubs.h header is not installed by install-headers, but is needed
 Thomas> for the gcc build. An empty stubs.h will work, as explained in
 Thomas> http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick is
 Thomas> used by Crosstool-NG.

Committed, thanks.

-- 
Bye, Peter Korsgaard
