From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 22:36:34 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/guile: fix host build without makeinfo
In-Reply-To: <20200307100007.1428472-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Mar 2020 11:00:07 +0100")
References: <20200307100007.1428472-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhcrvod9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix trailing whitespace

It is not really only about the host variant, so I dropped that and
committed, thanks.

-- 
Bye, Peter Korsgaard
