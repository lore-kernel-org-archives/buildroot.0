From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 May 2010 13:39:06 +0200
Subject: [Buildroot] [PATCH 02/12] lmbench: needs BR2_INET_RPC
In-Reply-To: <a5eec2fe8ef5dde4e21f9eede6a88bf66b794dfa.1273965305.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 16 May 2010 01:15:27 +0200")
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<a5eec2fe8ef5dde4e21f9eede6a88bf66b794dfa.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <877hn1zbfp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This package uses several pmap_*() functions in the C library, that
 Thomas> are only available if the C library has RPC support.

A comment "lmbench needs a toolchain with RPC support" would be good,
but I can add that myself.

-- 
Bye, Peter Korsgaard
