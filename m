From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 12:16:05 +0100
Subject: [Buildroot] [PATCH] Don't install in mysql directory
In-Reply-To: <56BE8C68.3050409@proximus.be>
References: <1450051027-23633-1-git-send-email-arnout@mind.be>
 <20151229212831.07ec737f@free-electrons.com>
 <56BDA833.4080506@proximus.be>
 <20160212104822.776f573f@free-electrons.com>
 <56BE8C68.3050409@proximus.be>
Message-ID: <20160213121605.54ef7700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Feb 2016 02:52:40 +0100, Johan Sagaert wrote:

> My app complained not finding libmysqlclient.so.16 because it was in 
> /usr/lib/mysql,

Which version of Buildroot are you using? As I said, we are now
installing the MySQL libraries in /usr/lib, and no longer
in /usr/lib/mysql.

It depends on whether you have
https://git.busybox.net/buildroot/commit/package/mysql?id=7b9c5d65e0dc3b6b55ff67196b8110c5a758da31
in your Buildroot version or not. This commit is only part of
2016.02-rc1.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
