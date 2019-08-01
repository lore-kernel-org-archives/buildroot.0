From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 10:55:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/dtc: disable valgrind
In-Reply-To: <20190729121638.6270-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Jul 2019 14:16:38 +0200")
References: <20190729121638.6270-1-fontaine.fabrice@gmail.com>
 <20190729121638.6270-2-fontaine.fabrice@gmail.com>
Message-ID: <87tvb11czc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since version 1.5.0, dtc optionally depends on valgrind so disable it by
 > setting NO_VALGRIND to 1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
