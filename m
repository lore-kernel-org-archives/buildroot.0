From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Dec 2017 22:23:20 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.1.x series
In-Reply-To: <20171207174352.5148-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 7 Dec 2017 18:43:52 +0100")
References: <20171207174352.5148-1-bernd.kuhls@t-online.de>
Message-ID: <871sk644hj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > Please note that the patch for mm/huge_memory.c
 > https://github.com/torvalds/linux/commit/a8f97366452ed491d13cf1e44241bc0b5740b1f0
 > fixing CVE-2017-1000405 was not included in this kernel version:

 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/diff/?id=v4.1.47&id2=v4.1.46&dt=2
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/log/mm/huge_memory.c?id=v4.1.47

Committed, thanks.

-- 
Bye, Peter Korsgaard
