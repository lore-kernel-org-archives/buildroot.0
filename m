From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:28:13 +0100
Subject: [Buildroot] [PATCH] package/mraa: disable tests build
In-Reply-To: <1456599856-11995-1-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Sat, 27 Feb 2016 20:04:16 +0100")
References: <1456599856-11995-1-git-send-email-romain.naour@gmail.com>
Message-ID: <877fhprdoi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > mraa build system is looking for a python interpreter >= 2.7 on the host due to
 > a typo in MRAA_CONF_OPTS. We must use -DBUILDTESTS=OFF instead of -DTESTS=OFF.

 > Fixes:
 > http://autobuild.buildroot.net/results/5f0/5f047c4c28b34f6b1bf2306a2b00bcc6a7481c01

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
