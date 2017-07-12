From: Heiko Abraham <heiko.abraham@hella-gutmann.com>
Date: Wed, 12 Jul 2017 08:18:19 +0000
Subject: [Buildroot] BlueZ and Bluetooth-SIG
Message-ID: <650377CF-0CAE-4DF2-A6A6-9BD91D1E90D7@hella-gutmann.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I test different versions of linux-kernels (3.10, 3.12, 3.18 for i.MX5/i.MX6) and BlueZ (4.101, 5.43, 5,45) but all combinations failed with Bluetooth-SIG test.
(Problems with eRTM and l2cap_disconnect for RFCOMM profile)

My assumption is, that an lot of LTS-kernel/BlueZ combinations are not compliant with Bluetooth-SIG. But that is required for an BT based embedded system.
Please note, some targets required an older linux kernel for OpenGL support.

Any suggestions, how to get an buildroot build, that compliant with bluetooth-sig?


Regards,
Heiko Abraham

--


________________________________

--
Hella Gutmann Solutions GmbH * Unternehmensform: Gesellschaft mit beschraenkter Haftung *
Firmensitz: 79241 Ihringen * Eingetragen im Handelsregister: AG Freiburg i.Br., HRB 290194 * Geschaeftsfuehrer: Andreas Habeck * USt-IdNr.: DE142208666
