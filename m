From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 22:52:15 +0200
Subject: [Buildroot] [PATCH 0/4] fix environment variables passing to
	configure/make
In-Reply-To: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Mon, 12 May 2014 07:27:02 +0400")
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87mwem67pc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Hi,
 > this series fixes erroneous usage of the 'CFLAGS+="..."' pattern in configure
 > and make steps, replacing it with 'CFLAGS="$(TARGET_CFLAGS) ..."'.

 > This fixes one issue reported by autobuilder and makes build commands look
 > correct in other cases.

 > Max Filippov (4):
 >   sqlcipher: fix passing CFLAGS/LDFLAGS to configure
 >   libcgroup: fix passing CFLAGS/LDFLAGS to configure
 >   ebtables: fix passing CFLAGS to configure
 >   sysstat: fix passing CFLAGS to make

Committed series, thanks.

-- 
Bye, Peter Korsgaard
