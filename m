From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:09:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/git: bump version to 2.15.0
In-Reply-To: <20171031081625.13343-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 31 Oct 2017 09:16:24 +0100")
References: <20171031081625.13343-1-bernd.kuhls@t-online.de>
Message-ID: <87bmkni171.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > To avoid the build error
 > grep.c:(.text+0xa02): undefined reference to `pcre_jit_exec'

 > we need to add NO_LIBPCRE1_JIT=1 according to
 > https://www.spinics.net/lists/git/msg314515.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
