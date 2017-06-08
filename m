From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 16:51:30 +0200
Subject: [Buildroot] [PATCH] linux: fix name of config variable
In-Reply-To: <20170604094839.23541-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 4 Jun 2017 11:48:39 +0200")
References: <20170604094839.23541-1-yann.morin.1998@free.fr>
Message-ID: <87tw3qa5xp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In 4c10eedc1 (systemd: enable required kernel features), we added
 > setting a few required kernel features to ensure systemd works.

 > However, there was a typo for one of the variables: CONFIG_TMPFS_XATTR
 > was written as CONFIG_TMPFS_POSIX_XATTR, which does not exist (and never
 > ever existed, at least not since 2.6.12)...

 > Fixes #9926.

Committed to master, 2017.05.x and 2017.02.x after dropping the
reference to #9926, thanks.

-- 
Bye, Peter Korsgaard
