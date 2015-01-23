From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 16:44:47 +0100
Subject: [Buildroot] [PATCH 1/2] php: security bump to version 5.5.21
In-Reply-To: <1421947066-25455-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 22 Jan 2015 14:17:45 -0300")
References: <1421947066-25455-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k30d7b80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-0231 - Use After Free Vulnerability in PHP's unserialize()
 > CVE-2014-9427 - Out of bounds read crashes php-cgi
 > CVE-2015-0232 - Free called on unitialized pointer

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
