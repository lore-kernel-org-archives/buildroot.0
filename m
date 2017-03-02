From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Mar 2017 18:00:29 +0100
Subject: [Buildroot] [PATCH] libsidplay2: fix build on ppc64le by not
	autoreconfiguring
In-Reply-To: <20170301225121.0f20f9a9@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 1 Mar 2017 22:51:21 +0100")
References: <1488401026-27933-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301225121.0f20f9a9@free-electrons.com>
Message-ID: <8737evhavm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,

 >> package/libsidplay2/0001-sidplay2-libs-2.1.1.patch | 254 ++++++---------------
 >> package/libsidplay2/libsidplay2.mk                 |   1 -
 >> 2 files changed, 75 insertions(+), 180 deletions(-)

 > Applied to master, thanks. Peter, this is a build fix, maybe we want it
 > for the LTS, even though I agree it only affects ppc64le, so it's maybe
 > not important enough.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
