From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 22:39:45 +0200
Subject: [Buildroot] [PATCH 2/6] package/crda: replace pycrypto by
 pycryptodomex
In-Reply-To: <20200426223325.1468127-2-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 27 Apr 2020 00:33:21 +0200")
References: <20200426223325.1468127-1-romain.naour@gmail.com>
 <20200426223325.1468127-2-romain.naour@gmail.com>
Message-ID: <878sh7ltym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > From [1]:
 > "PyCryptodome is a fork of PyCrypto, which is not maintained any more
 > (the last release dates back to 2013 [2]). It exposes almost the same
 > API, but there are a few incompatibilities [3]."

 > [1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
 > [2] https://pypi.org/project/pycrypto/#history
 > [3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html

 > Update the patch 0001-crda-support-python-3-in-utils-key2pub.py.patch
 > since it add pycrypto.

 > From [4]
 > "CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
 > ("cfg80211: support loading regulatory database as firmware file") added
 > support to use the kernel's firmware request API which looks for the
 > firmware on /lib/firmware. Because of this CRDA is legacy software for
 > older kernels. It will continue to be maintained."

 > [4] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tree/README?id=9856751feaf7b102547cea678a5da6c94252d83d#n8

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
