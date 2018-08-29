From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 15:43:21 +0200
Subject: [Buildroot] [PATCH v2] mender: fix ioctl build failure on
 powerpc64le / power8
In-Reply-To: <20180829115405.59305-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 29 Aug 2018 13:54:05 +0200")
References: <20180829115405.59305-1-giulio.benetti@micronovasrl.com>
Message-ID: <878t4p47ba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Build fails due to missing // +build ppc64le in ioctl_64_bit.go
 > Add patch to append ppc64le to // +build list.

 > Fixes
 > http://autobuild.buildroot.net/results/f22/f222b4389f9308363c386da25ec22a0919bc29fb//

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
