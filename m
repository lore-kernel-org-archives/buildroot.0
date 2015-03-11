From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:09:40 +0100
Subject: [Buildroot] [PATCH 2/2] tcpdump: security bump to version 4.7.3
In-Reply-To: <1426081428-32041-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Mar 2015 10:43:48 -0300")
References: <1426081428-32041-1-git-send-email-gustavo@zacarias.com.ar>
 <1426081428-32041-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oanzms6z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-0261 - issues with IPv6 mobility printer.
 > CVE-2015-2153 - issue with tcp printer.
 > CVE-2015-2154 - issue with ethernet printer.
 > CVE-2015-2155 - issue with force printer.

 > CVE-2014-9140 fix is upstream so patch dropped.
 > System libpcap upstream as well so dropped.

 > CVE-2014-8767, CVE-2014-8768 and CVE-2014-8769 don't seem to be upstream
 > so keep.

 > And add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
