From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Sep 2013 21:43:27 +0200
Subject: [Buildroot] [PATCH] Remove multimedia subdirectory
In-Reply-To: <1377853557-26832-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 30 Aug 2013 11:05:57 +0200")
References: <1377853557-26832-1-git-send-email-jezz@sysmic.org>
Message-ID: <874n9vyu8w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 J?r?me> Unless it was a group of sub-packages, packages was never regrouped by
 J?r?me> category. multimedia/ was an exception to this rule.

 J?r?me> This patch move packages/multimedia/ sub-directories to packages/. It
 J?r?me> keeps two subdirectories for gstream 0.10 and gstreamer 1.X.

Committed, thanks.

-- 
Bye, Peter Korsgaard
