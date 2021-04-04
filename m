From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 12:17:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: update samba4-cache.txt
 for fcntl flags check
In-Reply-To: <20210404084933.859933-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 4 Apr 2021 10:49:33 +0200")
References: <20210404084933.859933-1-bernd.kuhls@t-online.de>
Message-ID: <87ft061hh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/76a/76a411b78d764561457decd47b268f65059ba1b0/

 > Checking whether fcntl supports setting/geting hints : not found
 > ..
 > Cross answers file /home/giuliobenetti/autobuild/run/instance-2/output-1/build/samba4-4.14.2/cache.txt is incomplete

 > Samba4 has added a check for fcntl F_{G,S}ET_RW_HINT /
 > F_{G,S}ET_FILE_RW_HINT handling since:
 > https://gitlab.com/samba-team/devel/samba/-/commit/5084a69de14f24e9d804998580eefcba773fdd5a

 > Which is supported by the Linux kernel since 4.13 in commit
 > c75b1d9421f80f41 (fs: add fcntl() interface for setting/getting
 >  write life time hints), so add it to the cache file.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
