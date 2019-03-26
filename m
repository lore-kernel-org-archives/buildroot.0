From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 26 Mar 2019 11:53:52 +0100
Subject: [Buildroot] bdaddr from bluez-utils 5.x package
Message-ID: <CALtfCQaALkdTHOTbx-vBX7L_KSUzpuJG2QMqZMS8jOqRXiSyuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,


I am checking buildroot-2019.02 vs buildroot-2018.02.5 and it seems to
be that using the bluez-utils 5.x has disappeared the utility bdadd in
order to change the Bluetooth address from different devices using
this format:

NEW_BT_MAC=00:11:22:33:44:55
/usr/bin/bdaddr -i hci0 $NEW_BT_MAC

Could anyone confirm that?
Is there any other alternative for changing the mac address?


Best regards.

Oscar Gomez Fuente
