From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 19:50:08 +0100
Subject: [Buildroot] [PATCH v2] package/libevent: Fix broken download URL
In-Reply-To: <1453138720-16100-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 18 Jan 2016 18:38:40 +0100")
References: <1453138720-16100-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87a8o27me7.fsf@dell.be.48ers.dk>
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
 > ---
 > v2: the download URL should work now ;) (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
