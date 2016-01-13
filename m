From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:17:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: disable for static-only
	builds
In-Reply-To: <1452374016-16908-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 9 Jan 2016 22:13:36 +0100")
References: <1452374016-16908-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wprd2n8l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > vlc configure errors out for a non-shared build:
 > http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=d44151b3fb507141ce7f9b98e95fa11edcdaac01;hb=HEAD#l450

 > Fixes
 > http://autobuild.buildroot.net/results/f93/f93771b4f76b82197b930e6fde5eb7aebfe9c910/
 > http://autobuild.buildroot.net/results/4af/4af880a8a8a37efd57e12e18d43183ba49f5cbe0/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
