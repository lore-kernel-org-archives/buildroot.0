From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 22:47:41 +0200
Subject: [Buildroot] [PATCH v2 3/9] package/yajl: fix static link
In-Reply-To: <1409514922-9509-4-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:16 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-4-git-send-email-s.martin49@gmail.com>
Message-ID: <87mwakmln6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > - disable shared object build when BR2_PREFER_STATIC_LIB is set
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
