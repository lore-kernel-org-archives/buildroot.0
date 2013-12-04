From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 10:13:19 +0100
Subject: [Buildroot] [PATCH v3] package/tvheadend: unbreak
In-Reply-To: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 4 Dec 2013 01:08:41 +0100")
References: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877gblm11s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > tvheadend tries to impersonate an autotools package, when it is not.
 > This breaks the build.

 > tvheadend's ./configure tries to run compiled code.
 > This breaks the build.

 > Switch tvheadend over to using the generic-package infrastructure,
 > and provide carefully-crafted _CMDS for each steps.

 > We still keep a post-install hook to install our "DB" since it is not
 > part of tvheadend, but an addition of our own packaging of tvheadend.

 > Fixes:
 >     http://autobuild.buildroot.net/results/3ea/3eaa17b94975477263fe12e201eec9cbeeb2912c/
 >     http://autobuild.buildroot.net/results/7c8/7c85db0dfab98808c97a5ef17dec9d1071dc0d49/
 > and a few others as well.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Sorry, this was the one I committed, not v1 (with the patch commit
message tweaked).

-- 
Bye, Peter Korsgaard
