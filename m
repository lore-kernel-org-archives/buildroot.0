From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Oct 2016 14:56:43 +0200
Subject: [Buildroot] [PATCH] pppd: fix config file name
In-Reply-To: <1477071956-17212-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Fri, 21 Oct 2016 23:15:56 +0530")
References: <1477071956-17212-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <874m44bkz8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > When radius plugin is enabled, we get following error:
 > /usr/bin/install: cannot stat '/home/rahul.bedarkar/buildroot/output/build/pppd-2.4.7/pppd/plugins/radius/etc/server': No such file or directory

 > Name of config file is 'servers' instead of 'server'.

Committed, thanks.

-- 
Bye, Peter Korsgaard
