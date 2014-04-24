From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2014 22:35:37 +0200
Subject: [Buildroot] [PATCH] acpid: unavailable for external uClibc
	toolchains
In-Reply-To: <1398261303-23311-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 23 Apr 2014 10:55:03 -0300")
References: <1398261303-23311-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uqu1n52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > External non-patched uClibc toolchains lack the MSG_CMSG_CLOEXEC
 > definition, so does internal uClibc <0.9.33, so exclude it for those
 > scenarios. Fixes:
 > http://autobuild.buildroot.net/results/6d4/6d471942788fa05f324649ab15e6ca382e46df9c/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
