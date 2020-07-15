From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:21:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/mutt: fix CVE-2020-14093
In-Reply-To: <20200619221150.284997-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 20 Jun 2020 00:11:49 +0200")
References: <20200619221150.284997-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo34wk20.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Mutt before 1.14.3 allows an IMAP fcc/postpone man-in-the-middle attack
 > via a PREAUTH response.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
