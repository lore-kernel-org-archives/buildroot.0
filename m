From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:39:46 +0200
Subject: [Buildroot] [PATCH v1] pcre2: enable no MMU build
In-Reply-To: <20170710185122.16031-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 10 Jul 2017 20:51:22 +0200")
References: <20170710185122.16031-1-ps.report@gmx.net>
Message-ID: <871spmsqyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Use '--disable-pcre2grep-callout' for !BR2_USE_MMU, disables
 > fork usage.

 > Fixes [1]:

 >     CCLD     pcre2grep
 >   src/pcre2grep-pcre2grep.o: In function `pcre2grep_callout':
 >   pcre2grep.c:(.text+0x402): undefined reference to `fork'
 >   collect2: error: ld returned 1 exit status

 > [1] http://autobuild.buildroot.net/results/2c2/2c2665844748a3bdb010315200eea70aa3504b95

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
