From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2020 03:17:59 +0000
Subject: [Buildroot] [Bug 13261] When doing lldpd 1.0.4 Configuring,
 error encountered: "checking if system libevent works as
 expected... configure: error: *** unusable system libevent"
In-Reply-To: <bug-13261-163@https.bugs.busybox.net/>
References: <bug-13261-163@https.bugs.busybox.net/>
Message-ID: <bug-13261-163-SwlletC0V6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13261

--- Comment #5 from eric.hu at nokia-sbell.com ---
(In reply to Fabrice Fontaine from comment #1)
1. Please refer to attachment config.log
2. Please refer to attachment defconfig
3. buildroot version 2020.02.6

When I do configure and make in lldp directory, it can pass, but seems libevent
is shipped which is difference with doing build from root directory, please
refer to attachment (lldp directory configure and make log)

checking for libevent... no
configure: using shipped libevent
=== configuring in libevent
(/repo/erhu/buildroot/output/build/lldpd-1.0.4/libevent)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
