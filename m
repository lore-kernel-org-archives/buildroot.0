From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:07:27 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] Revert "package/domoticz: drop boost date-time dependency"
In-Reply-To: <20210426191113.512637-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Apr 2021 21:11:12 +0200")
References: <20210426191113.512637-1-fontaine.fabrice@gmail.com>
Message-ID: <877dkog3g0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This reverts commit 4b4d98e2c5165c3121e670192970fc909cae6d8a as
 > Boost::date_time is still used by domoticz (in pmain/Scheduler.cpp and
 > push/BasePush.cpp)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/493a2e93fe6121f118293a268f986ee51009b7e8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
