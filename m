From: Srijan Nandi - Gmail <srijan.nandi@gmail.com>
Date: Sun, 5 Jul 2020 18:27:31 +0530
Subject: [Buildroot] To stop a systemd service from starting by default
Message-ID: <BF61AD00-EF73-4CA4-89D4-2F9C21D9B185@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I am trying to stop certain systemd services from starting up by default. I have added the following lines in 80-buildroot.preset,

disable dhcpcd.service
disable nginx.service
disable ntpd.service
disable org.cups.cupsd.service
disable org.cups.cups-lpd at .service
disable postgresql.service
disable redis.service
disable rsyslog.service
disable sshd.service
disable strongswan.service
disable suricata.service

But still when I boot, all the services are trying to start causing the boot to fail. Can anyone tell me where to put the presets, to stop then from starting up by default.


Thanks and Regards,
-=Srijan Nandi
