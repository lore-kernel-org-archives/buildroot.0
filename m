From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 09:21:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/quickjs: disable on nios2
In-Reply-To: <20210414212608.1376653-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Apr 2021 23:26:08 +0200")
References: <20210414212608.1376653-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1iyrfru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
 > nios2 since its addition in commit
 > 5d50793659acb95050c110d5fc05399df20ce30b

 > Fixes:
 >  - http://autobuild.buildroot.org/results/69e280a7f478d1b16be989c7bd559f766053134b
 >  - http://autobuild.buildroot.org/results/f2c3ef7e3bbe30ac24710288336adabebd8b83a6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
