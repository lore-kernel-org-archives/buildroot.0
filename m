From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:29:51 +0100
Subject: [Buildroot] [PATCH 2/3] package/libcurl: security bump version
	to 7.47.0
In-Reply-To: <1454011287-28408-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Thu, 28 Jan 2016 21:01:26 +0100")
References: <1454011287-28408-1-git-send-email-bernd.kuhls@t-online.de>
 <1454011287-28408-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87fuxho0j4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > CVE-2016-0754: remote file name path traversal in curl tool for Windows
 > CVE-2016-0755: NTLM credentials not-checked for proxy connection re-use

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
