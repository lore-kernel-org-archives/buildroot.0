From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 16:10:26 +0200
Subject: [Buildroot] [PATCH] luajit: fix a runtime error
In-Reply-To: <1400174275-13838-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Thu, 15 May 2014 19:17:55 +0200")
References: <1400174275-13838-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87tx8prezx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > this patch fixes :
 >     luajit: error while loading shared libraries: libluajit-5.1.so.2: cannot open shared object file: No such file or directory

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
