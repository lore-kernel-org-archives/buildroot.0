From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 10:20:54 +0200
Subject: [Buildroot] [PATCH v1] utils/check-package: fix flake8 warning
In-Reply-To: <20190519211528.9917-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 19 May 2019 23:15:28 +0200")
References: <20190519211528.9917-1-ps.report@gmx.net>
Message-ID: <87d0kdy1sp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fix flake 8 warning (introduced with commit [1]):
 >   utils/checkpackagelib/lib.py:56:1: E302 expected 2 blank lines, found 1

 > [1] https://git.buildroot.net/buildroot/commit/?id=8e352c32b0beded97a8a5c1e9edc9d618514ee7b

 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
