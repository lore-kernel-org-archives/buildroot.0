From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:05:31 +0200
Subject: [Buildroot] [PATCHv2 02/14] eglibc: libstdc++ is not part of
	the C library
In-Reply-To: <1378138000-12739-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:28 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwndkd7o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For some reason, the eglibc.mk file was trying to install libstdc++.so
 Thomas> from eglibc to the target. But the C++ standard library is provided by
 Thomas> GCC, not by the C library.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
