From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 15:56:46 +0200
Subject: [Buildroot] [PATCH] Fixing ntpd time syncing problem
In-Reply-To: <1402405120-3695-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Tue, 10 Jun 2014 14:58:40 +0200")
References: <1402405120-3695-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87tx6qskip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Add ntp.conf file to make ntpd syncing.
 > Starting ntpd daemon with -g to sync time also with big offsets.
 > Removes the use of deprecated ntpdate command for initial time sync.

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
