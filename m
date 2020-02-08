From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 09:32:41 +0100
Subject: [Buildroot] [PATCH] package/uclibc: fix ctype.h is*_l
 definitions
In-Reply-To: <20200207195144.4060-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Fri, 7 Feb 2020 11:51:44 -0800")
References: <20200207195144.4060-1-jcmvbkbc@gmail.com>
Message-ID: <87mu9tv5qu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > ctype locale-specific macro definitions are broken because they result
 > in dereference of pointer to structure of incomplete type.
 > Drop these macros since they are optional and let applications use
 > functions with the same names.

 > Backported from:
 >   https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=d1a3ca7ca56630fddde7311a0474eed4a21335a7
 > Fixes:
 >   http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
