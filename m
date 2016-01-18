From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 16:29:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libevent: Fix broken download
	URL
In-Reply-To: <1453068619-20590-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 17 Jan 2016 23:10:19 +0100")
References: <1453068619-20590-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87io2q7voe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream URL has changed on Sourceforge:
 >>>> libevent 2.0.22-stable Downloading
 > --2016-01-17 23:06:31--  http://downloads.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
 > Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
 > Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2016-01-17 23:06:31 ERROR 404: Not Found.

 > Additionally the project moved to github:
 > http://sourceforge.net/projects/levent/

 > "As of 2015-10-07, this project may now be found at
 >  https://github.com/libevent/libevent."

 > This patch points Config.in to the new upstream URL and fixes the broken
 > download URL by using github.com.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks, but it doesn't seem to work here?

>>> libevent 2.0.22-stable Downloading
--2016-01-18 16:27:55--  https://github.com/libevent/libevent/archive/2.0.22-stable/libevent-2.0.22-stable.tar.gz
Resolving github.com (github.com)... 192.30.252.129
Connecting to github.com (github.com)|192.30.252.129|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/libevent/libevent/tar.gz/2.0.22-stable/libevent-2.0.22-stable [following]
--2016-01-18 16:27:55--  https://codeload.github.com/libevent/libevent/tar.gz/2.0.22-stable/libevent-2.0.22-stable
Resolving codeload.github.com (codeload.github.com)... 192.30.252.160
Connecting to codeload.github.com (codeload.github.com)|192.30.252.160|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-01-18 16:27:56 ERROR 404: Not Found.

-- 
Bye, Peter Korsgaard
