From: victor.hiairrassary.ml at gmail.com <victor.hiairrassary.ml@gmail.com>
Date: Wed,  6 Feb 2013 10:30:03 +0100
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
Message-ID: <1360143004-29603-1-git-send-email-victor.hiairrassary.ml@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch bump boost version to 1.53.0. It adds an option for compiling 
boost-context, and blacklist atomic boost library since it does not 
compile with uClibc : see https://svn.boost.org/trac/boost/ticket/7979

Thanks in advance!

Regards,
Victor Hiairrassary
