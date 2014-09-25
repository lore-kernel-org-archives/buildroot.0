From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 09:51:15 +0200
Subject: [Buildroot] [PATCH 3/4] lttng-libust: bump to version 2.5.0
In-Reply-To: <1411540985-22792-3-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Wed, 24 Sep 2014 08:43:04 +0200")
References: <1411540985-22792-1-git-send-email-jezz@sysmic.org>
 <1411540985-22792-3-git-send-email-jezz@sysmic.org>
Message-ID: <8761gc16ks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
 > was upstreamed

Then we can presumably drop AUTORECONF = YES?

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
