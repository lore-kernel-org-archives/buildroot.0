From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 21:01:39 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: fix build breakage with
	libcap
In-Reply-To: <1367759675-26734-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 5 May 2013 10:14:35 -0300")
References: <1367759675-26734-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878v3tp7xo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> ltp-testsuite needs libcap with file attributes which in turn needs
 Gustavo> attr.
 Gustavo> Only libcap is checked for so if it lacks file attr support it breaks.
 Gustavo> Disable libcap support unless it's got attr support, fixes:
 Gustavo> http://autobuild.buildroot.net/results/b16b20963c7cb17d8e220a5baa1356372ebf85a6/

Committed, thanks.

-- 
Bye, Peter Korsgaard
