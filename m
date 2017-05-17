From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:37:46 +0200
Subject: [Buildroot] [PATCH] rtmpdump: security bump to current HEAD
In-Reply-To: <20170515153229.29831-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 15 May 2017 17:32:29 +0200")
References: <20170515153229.29831-1-peter@korsgaard.com>
Message-ID: <87pof743tx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > - CVE-2015-8271: The AMF3CD_AddProp function in amf.c in RTMPDump 2.4 allows
 >   remote RTMP Media servers to execute arbitrary code
 >   https://www.talosintelligence.com/reports/TALOS-2016-0067/

 > - CVE-2015-8272: RTMPDump 2.4 allows remote attackers to trigger a denial of
 >   service (NULL pointer dereference and process crash).
 >   https://www.talosintelligence.com/reports/TALOS-2016-0068/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
