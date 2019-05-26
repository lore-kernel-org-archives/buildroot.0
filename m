From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:19:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpm: fix build with NLS
In-Reply-To: <20190512121252.6049-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 May 2019 14:12:52 +0200")
References: <20190512121252.6049-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhn9lght.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add TARGET_NLS_LIBS to LIBS to definitely fix linking with lintl instead
 > of calling autoreconf

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a1446b419f5f59f65fe80849182e38457de203b5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
