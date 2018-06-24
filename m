From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:16:24 +0200
Subject: [Buildroot] [PATCH v3 1/5] package/gdb: rework dependency for
 C++11
In-Reply-To: <20180624135310.16514-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 24 Jun 2018 15:53:06 +0200")
References: <20180624135310.16514-1-thomas.petazzoni@bootlin.com>
 <20180624135310.16514-2-thomas.petazzoni@bootlin.com>
Message-ID: <87a7rkf113.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As we are about to switch to 8.0 as the default gdb dependency, we

s/dependency/version/.

Committed, thanks.

-- 
Bye, Peter Korsgaard
