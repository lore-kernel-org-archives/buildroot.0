From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Feb 2017 14:53:36 +0100
Subject: [Buildroot] [PATCH] quagga: security bump to version 1.1.1
In-Reply-To: <e55666701bd52cc6cb17c23a5f0054eaf01c00c4.1486643488.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 9 Feb 2017 14:31:28 +0200")
References: <e55666701bd52cc6cb17c23a5f0054eaf01c00c4.1486643488.git.baruch@tkos.co.il>
Message-ID: <87d1ero4gv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-5495: Telnet interface input buffer allocates unbounded amounts
 > of memory, leading to DoS.

 > Add optional dependency on protobuf-c.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
