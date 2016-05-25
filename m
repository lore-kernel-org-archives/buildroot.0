From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 23:32:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/ustr: disable on musl
In-Reply-To: <1464030954-22737-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 23 May 2016 21:15:54 +0200")
References: <1464030954-22737-1-git-send-email-bernd.kuhls@t-online.de>
 <1464030954-22737-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87twhl7rin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > libsemanage is the only package depending on ustr, both packages do not
 > build using a musl-based toolchain, suggested by Thomas:
 > http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149138

 > Fixes
 > http://autobuild.buildroot.net/results/a41/a416001516d98d58849f1d1f8f49f49d3d28f3a2/
 > http://autobuild.buildroot.net/results/f51/f5115516bd514afbb71a9460e82c889bcc18e7e2/
 > and many others

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
