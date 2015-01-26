From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 23:03:04 +0100
Subject: [Buildroot] [PATCH] jasper: add security fixes for
	CVE-2014-8157/8158
In-Reply-To: <1422305149-21671-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 26 Jan 2015 17:45:49 -0300")
References: <1422305149-21671-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mrd19pj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-8157 - dec->numtiles off-by-one check in jpc_dec_process_sot()
 > CVE-2014-8158 - unrestricted stack memory use in jpc_qmfb.c

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
