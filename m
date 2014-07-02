From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 11:01:08 +0200
Subject: [Buildroot] [PATCH v3] grub2: Specify boot partition
In-Reply-To: <1404236987-21979-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Tue, 1 Jul 2014 19:49:47 +0200")
References: <1404236987-21979-1-git-send-email-jezz@sysmic.org>
Message-ID: <87mwcscey3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Since boot partition was not specified, grub tools try to detect it
 > automatically. This patch add an option to force it.

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---
 > v2 -> v3:
 >  * Make parenthesis around partition name implicit

Committed, thanks.

-- 
Bye, Peter Korsgaard
