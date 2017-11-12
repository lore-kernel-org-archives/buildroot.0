From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Nov 2017 17:53:02 +0100
Subject: [Buildroot] [PATCH 2/2] python-numpy: also disable ARC HS with
 glibc
In-Reply-To: <20171112141751.11051-2-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Nov 2017 15:17:51 +0100")
References: <20171112141751.11051-1-thomas.petazzoni@free-electrons.com>
 <20171112141751.11051-2-thomas.petazzoni@free-electrons.com>
Message-ID: <87375jtp5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Building python-numpy on ARC HS with glibc fails due to missing FE_*
 > definitions in <fenv.h>. Therefore, python-numpy is only available on
 > ARC HS with a C library other than glibc.

 > Fixes:

 >   http://autobuild.buildroot.net/results/6b9a3310bb4f8c1fd7db0ef4476458b3eec2bf2e/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
