From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 17:39:14 +0200
Subject: [Buildroot] [PATCH] systemd: do not use host system-uid/gid
 ranges
In-Reply-To: <20180308142509.26795-1-anssi.hannula@bitwise.fi> (Anssi
 Hannula's message of "Thu, 8 Mar 2018 16:25:09 +0200")
References: <20180308142509.26795-1-anssi.hannula@bitwise.fi>
Message-ID: <87vad3f2l9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anssi" == Anssi Hannula <anssi.hannula@bitwise.fi> writes:

 > systemd meson.build uses values from host /etc/login.defs if
 > system-uid-max and system-gid-max build options are not explicitly
 > specified.

 > Avoid that by setting system-uid-max and system-gid-max to 999 which is
 > the systemd default if SYSTEM_UID_MAX and SYSTEM_GID_MAX are not set in
 > /etc/login.defs.

 > Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
