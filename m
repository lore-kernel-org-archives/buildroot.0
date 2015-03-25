From: Alexey Mednyy <swexru@gmail.com>
Date: Wed, 25 Mar 2015 23:10:33 +0300
Subject: [Buildroot] wpa_supplicant not starting correctly
Message-ID: <55131639.9040408@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello there,

I've got configuration with eudev,dbus and  busybox init.
Previously everything worked fine, but now wpa_supplicant not starting.
and I see this in /var/log/messages :

Mar 25 22:56:25 hostname daemon.notice dbus[120]: [system] Activating
service name='fi.w1.wpa_supplicant1' (using servicehelper)
Mar 25 22:56:26 hostname daemon.info init: starting pideudev 146, tty
'/dev/ttyS0': '/sbin/getty -L  ttyS0 0 vt100 '
Mar 25 22:56:26 hostname daemon.notice dbus[120]: [system] Activated
service 'fi.w1.wpa_supplicant1' failed: Failed to execute program
fi.w1.wpa_supplicant1: Success

I'm not an expert in dbus, so asking for help what causes such problem?
I think before some recent commit wpa_supplicant started by init script
not by dbus is it true?


-- 
_________________________________
Best regards, Mednyy Alexey.
