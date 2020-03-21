From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 20:17:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs host-python3
In-Reply-To: <20200308111812.3065154-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Mar 2020 12:18:12 +0100")
References: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
Message-ID: <87k13d5xgr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-python3 is a mandatory dependency since bump to version 4.10.0 and
 > https://gitlab.com/samba-team/devel/samba/-/commit/5ddff307b4af5c82d5064745f5bd2c33bd340ced
 > because buildtools/bin/waf shebang is set to "/usr/bin/env python3"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2634eb7824beb34f485cf40670f6959515f008ad

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
