From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2020 23:01:13 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: add
 upstream security fixes for CVE-2020-14360 / 25712
In-Reply-To: <20201201174903.18381-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 1 Dec 2020 18:49:03 +0100")
References: <20201201174903.18381-1-peter@korsgaard.com>
Message-ID: <87zh2xxk2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > * CVE-2020-14360 / ZDI CAN 11572 XkbSetMap Out-Of-Bounds Access

 >   Insufficient checks on the lengths of the XkbSetMap request can lead to
 >   out of bounds memory accesses in the X server.

 > * CVE-2020-25712 / ZDI-CAN-11839 XkbSetDeviceInfo Heap-based Buffer Overflow

 >   Insufficient checks on input of the XkbSetDeviceInfo request can lead to a
 >   buffer overflow on the head in the X server.

 > For more details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2020/12/01/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
