From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 23:17:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/monkey: drop package
In-Reply-To: <20210508184416.3391369-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 8 May 2021 20:44:16 +0200")
References: <20210508184416.3391369-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1ihudrf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As stated in commit 26a7d912f4a44bce558ee24bbadb5d10527f68c1, upstream
 > is aware than the lack of release is an issue but no comments since
 > 2018: https://github.com/monkey/monkey/issues/276

 > Moreover, TLS support is broken since 2016 but again upstream does not
 > seem to care about it: https://github.com/monkey/monkey/issues/336

 > So just drop monkey

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0626ebab4f084d9b97d6696c7d4ebf7760d776a3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
