From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 23:33:51 +0200
Subject: [Buildroot] [PATCH 3/3] support/config-fragments/autobuild:
 make br-arm-internal-glibc bleeding edge
In-Reply-To: <20190802205149.28342-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 2 Aug 2019 22:51:48 +0200")
References: <20190802205149.28342-1-thomas.petazzoni@bootlin.com>
 <20190802205149.28342-3-thomas.petazzoni@bootlin.com>
Message-ID: <87d0hnp800.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > We do not have any configuration that tests the very bleeding edge gcc
 > and binutils versions, so let's change br-arm-internal-glibc to use
 > the latest version of gcc (9.x right now) and binutils (2.32 right
 > now). The idea is that this defconfig should be updated to the latest
 > version of gcc and binutils when their version is bumped.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
