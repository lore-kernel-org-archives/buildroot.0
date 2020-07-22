From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:14:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/ngircd: security bump to
 version 26
In-Reply-To: <20200625214011.1531565-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 25 Jun 2020 23:40:11 +0200")
References: <20200625214011.1531565-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7u0ja2j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-14148: The Server-Server protocol implementation in
 >   ngIRCd before 26~rc2 allows an out-of-bounds access, as demonstrated
 >   by the IRC_NJOIN() function.
 > - Fix a static build failure with openssl thanks to
 >   https://github.com/ngircd/ngircd/commit/ad86a41eeed9f85d74bb50a25fa0bf4515aaf3af
 > - Update indentation in hash file (two spaces)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/078a7afc432786316a1d2ea03f96444ff741b942

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
