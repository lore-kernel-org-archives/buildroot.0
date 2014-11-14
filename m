From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 19:26:48 -0300
Subject: [Buildroot] [PATCH 05/10] start-stop-daemon: new package
In-Reply-To: <54667DAB.5060503@mind.be>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
 <54667DAB.5060503@mind.be>
Message-ID: <546681A8.9060804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/2014 07:09 PM, Arnout Vandecappelle wrote:

>> +START_STOP_DAEMON_VERSION = 1.16.15
> 
>  Why not 1.17.21?

The 1.17 unstable series isn't too happy cross-compiling.

>> +START_STOP_DAEMON_LICENSE = GPLv2+
>> +START_STOP_DAEMON_LICENSE_FILES = debian/copyright
> 
>  COPYING seems more appropriate/usual.

As Karoly pointed out start-stop-daemon itself is Public Domain, so i've
adjusted for the upcoming v3 series to point to the source where it's
mentioned instead.
Regards.
