From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2015 23:10:57 +0100
Subject: [Buildroot] [PATCH 0/2] core: use merged /usr in staging
	(branch merged-usr-staging)
In-Reply-To: <cover.1448575841.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 26 Nov 2015 23:13:38 +0100")
References: <cover.1448575841.git.yann.morin.1998@free.fr>
Message-ID: <87610lpyfi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > As reported by Pieterjan, when doing remote debugging with gdbserver on
 > a merged /usr setup, the remote gdb would only look for libraries in
 > staging/lib and never in staging/usr/lib.

 > This series replicates in staging the same merged /usr handling as we
 > have for target/.

 > This is implemented in the skeleton package, as it is the only easy
 > place that is guaranteed to be before all other packages *and* before
 > the toolchains.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
