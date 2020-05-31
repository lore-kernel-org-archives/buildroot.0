From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 22:40:26 +0200
Subject: [Buildroot] [PATCH 4/6] package/python-pycrypto: remove package
In-Reply-To: <20200426223325.1468127-4-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 27 Apr 2020 00:33:23 +0200")
References: <20200426223325.1468127-1-romain.naour@gmail.com>
 <20200426223325.1468127-4-romain.naour@gmail.com>
Message-ID: <874krvltxh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > This package doesn't work with Python 3.8 since the code contains
 > time.clock() that was deprecated in Python 3.3 and removed in Python 3.8.

 > Instead of applying non upstream patches from Fedora [1], python-pycrypto
 > was replaced by python-pycryptodomex for crda and optee-os package.
 > Now we can remove safely this package.

 > [1] http://lists.busybox.net/pipermail/buildroot/2020-April/280683.html

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/498144209

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
