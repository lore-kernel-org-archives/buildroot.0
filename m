From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:34:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/mutt: security bump to version
 2.0.7
In-Reply-To: <20210521185729.295695-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 21 May 2021 20:57:29 +0200")
References: <20210521185729.295695-1-fontaine.fabrice@gmail.com>
Message-ID: <87v96puzok.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-32055: Mutt 1.11.0 through 2.0.x before 2.0.7 (and NeoMutt
 > 2019-10-25 through 2021-05-04) has a $imap_qresync issue in which
 > imap/util.c has an out-of-bounds read in situations where an IMAP
 > sequence set ends with a comma. NOTE: the $imap_qresync setting for
 > QRESYNC is not enabled by default.

 > https://gitlab.com/muttmua/mutt/-/blob/mutt-2-0-7-rel/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

For 2021.02.x I have instead backported the upstream patch to fix the
issue for our 1.14.7 version.

-- 
Bye, Peter Korsgaard
