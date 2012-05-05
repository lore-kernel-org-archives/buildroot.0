From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 19:35:15 +0200
Subject: [Buildroot] [PATCH 1/2] libaio: make available only on
	supported architectures
In-Reply-To: <f91dca9115c62024abe481cbf529baece84f70ec.1336235161.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 5 May 2012 18:26:05 +0200")
References: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
 <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
 <f91dca9115c62024abe481cbf529baece84f70ec.1336235161.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fwbecyzw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libaio has some architecture-specific code, and isn't available for
 Thomas> all architectures that Buildroot support.

Committed, thanks.

-- 
Bye, Peter Korsgaard
