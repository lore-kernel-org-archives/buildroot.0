From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 22:57:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump to
 version 5.2.1
In-Reply-To: <CAPi7W83nWZ4osh=TTMQWoj=ZGF2J2vz0+yCMxMrGSEw5QsXmWA@mail.gmail.com>
 (Fabrice Fontaine's message of "Mon, 19 Aug 2019 15:57:33 +0200")
References: <20190818120432.22829-1-fontaine.fabrice@gmail.com>
 <20190819154603.51a042a2@windsurf.home>
 <CAPi7W83nWZ4osh=TTMQWoj=ZGF2J2vz0+yCMxMrGSEw5QsXmWA@mail.gmail.com>
Message-ID: <87pnl0g9g5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> I must say this is quite big of a change for master at this point, and
 >> for a security bump in general. I'm not sure between applying this, or
 >> just cherry-picking the two commits that fix the CVEs.

 > Cherry-picking the two commits for master is probably better.
 > The CVE-2019-15133 can be retrieved here:
 > https://sourceforge.net/p/giflib/code/ci/799eb6a3af8a3dd81e2429bf11a72a57e541f908
 > The CVE-2018-11490 can be retrieved here:
 > https://sourceforge.net/p/giflib/code/ci/08438a5098f3bb1de23a29334af55eba663f75bd

Agreed, care to send such a patch?

Thanks!

-- 
Bye, Peter Korsgaard
