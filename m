From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Oct 2013 23:18:48 +0200
Subject: [Buildroot] [PATCHv3 01/20] glibc: both eglibc and glibc need
	host-gawk
In-Reply-To: <1381256237-27948-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:16:58 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761t75umf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, only the eglibc build was pulling host-gawk as a
 Thomas> dependency, but after more testing, it turns out that the glibc build
 Thomas> also requires host-gawk.

Committed, thanks.

-- 
Bye, Peter Korsgaard
