From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:34:44 +0100
Subject: [Buildroot] [PATCH] skeleton: sync /etc/shadow with /etc/passwd
In-Reply-To: <1446048433-24815-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Wed, 28 Oct 2015 17:07:13 +0100")
References: <1446048433-24815-1-git-send-email-jezz@sysmic.org>
Message-ID: <87bnbi7hbv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Synchronize /etc/shadow with /etc/passwd:
 >   - remove "halt" and "uucp"
 >   - add "sys", "mail" and "www-data"

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
