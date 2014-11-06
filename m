From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Nov 2014 09:11:01 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.39.0
In-Reply-To: <1415197892-30325-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 5 Nov 2014 11:31:32 -0300")
References: <1415197892-30325-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vbmszr3e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-3707 - libcurl's function curl_easy_duphandle() has a bug that
 > can lead to libcurl eventually sending off sensitive data that was not
 > intended for sending.

 > Removed patch that was upstream and now in the release.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks - And thanks to Vicente for the review&test.

-- 
Bye, Peter Korsgaard
