From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 22:39:08 +0200
Subject: [Buildroot] [PATCH 1/6] package/python-pycryptodomex: add host
 variant
In-Reply-To: <20200426223325.1468127-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 27 Apr 2020 00:33:20 +0200")
References: <20200426223325.1468127-1-romain.naour@gmail.com>
Message-ID: <87d06jltzn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Adding a host variant allow to replace host-python-pycrypto
 > by host-python-pycryptodomex for crda and optee-os packages.

 > From [1]:
 > "PyCryptodome is a fork of PyCrypto, which is not maintained any more
 > (the last release dates back to 2013 [2]). It exposes almost the same
 > API, but there are a few incompatibilities [3]."

 > [1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
 > [2] https://pypi.org/project/pycrypto/#history
 > [3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > For master and 2020.02.x.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
