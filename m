From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 22:29:08 +0100
Subject: [Buildroot] [PATCH] system/permissions: /etc/random-seed must
	be mode 600
In-Reply-To: <1690999.xJl8MaTsPY@sagittea> (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Thu, 20 Nov 2014 22:27:11 +0100")
References: <1416517694-7952-1-git-send-email-gustavo@zacarias.com.ar>
 <1690999.xJl8MaTsPY@sagittea>
Message-ID: <871toxftnf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > On Thursday 20 November 2014 18:08:14 Gustavo Zacarias wrote:
 >> Otherwise it's a big security risk.
 >> 
 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> ---
 >> system/device_table.txt | 1 +
 >> 1 file changed, 1 insertion(+)
 >> 
 >> diff --git a/system/device_table.txt b/system/device_table.txt
 >> index e15412d..8e7dbd2 100644
 >> --- a/system/device_table.txt
 >> +++ b/system/device_table.txt
 >> @@ -11,6 +11,7 @@
 >> /etc					d	755	0	0	-	-	-	-	-
 >> /root d 700 0 0 - - - - -
 >> /var/www				d	755	33	33	-	-	-	-	-
 >> +/etc/random-seed			f	600	0	0	-	-	-	-	-

 > Just curiosity, does it make sense to provide a random seed? I mean, it is not 
 > very random, is it?

Indeed. My thoughts exactly. Gustavoz?

-- 
Bye, Peter Korsgaard
