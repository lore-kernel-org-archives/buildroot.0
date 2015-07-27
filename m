From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Mon, 27 Jul 2015 19:36:12 +0200
Subject: [Buildroot] Bluetooth low energy and bluez
Message-ID: <20150727173611.GA18619@arthur-dreem>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to use bluetooth low energy with buildroot with custom profile and
service. I am playing with gatt server/client example from bluez right now to
try to understand the ble specification.

I have two questions on bluez buildroot package:

- How can I compile my code using gatt api from bluez ? I does not see any
external api right now in the current bluez package. The only way is to compile
directly my code in bluez package
- Is there a better solution than bluez API ? I know that I can use dbus for
example but it seems that dbus does not allow to define your own profile/service

Thanks
Arthur.
