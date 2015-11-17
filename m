From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 21:41:59 +0100
Subject: [Buildroot] [PATCH] skeleton: remove unused /etc/issue
In-Reply-To: <1447776985-20087-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Tue, 17 Nov 2015 17:16:25 +0100")
References: <1447776985-20087-1-git-send-email-jezz@sysmic.org>
Message-ID: <87d1v8cq94.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > /etc/issue is managed with BR2_TARGET_GENERIC_ISSUE. In case
 > BR2_TARGET_GENERIC_ISSUE is set (which is default), /etc/issue
 > is overwritten. In case BR2_TARGET_GENERIC_ISSUE is not set,
 > we don't want /etc/issue exist.

 > Finaly, remove /etc/issue from skeleton.

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
