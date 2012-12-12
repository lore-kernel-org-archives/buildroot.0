From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Dec 2012 22:25:57 +0100
Subject: [Buildroot] [PATCH 1/2] libhid: replace patch on configure by
	patch on configure.ac
In-Reply-To: <1355341123-7974-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 12 Dec 2012 20:38:42 +0100")
References: <1355341123-7974-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehivm07u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In order to fix some other build problem of libhid, we'll need to do
 Thomas> modifications to the configure.ac. Therefore, let's first convert the
 Thomas> current patch on configure to a patch on configure.ac, and mark the
 Thomas> package as AUTORECONF=YES.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
