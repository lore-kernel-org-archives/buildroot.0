From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 23:32:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/libsemanage: disable on musl
In-Reply-To: <1464030954-22737-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 23 May 2016 21:15:53 +0200")
References: <1464030954-22737-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87y46x7rit.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Suggested by Thomas:
 > http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149138
 > "getpwent_r() is a glibc-specific extension, so it will most likely not
 >  be implemented by musl."

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
