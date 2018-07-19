From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:35:22 +0200
Subject: [Buildroot] [PATCH] utils/test-pkg: log the output of
 merge-config
In-Reply-To: <20180708102659.26293-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 8 Jul 2018 12:26:59 +0200")
References: <20180708102659.26293-1-yann.morin.1998@free.fr>
Message-ID: <87bmb2c3j9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the stdout is consigned to oblivion, while the stderr is not
 > redirected at all. So, when the configuration under test redefines a
 > symbol, like is the case when testing busybox for example, there is an
 > ugly warning.

 > So, just redirect both stdout and stderr to the logfile.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
