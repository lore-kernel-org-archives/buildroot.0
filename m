From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2011 13:44:05 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <1321879312.2085.18.camel@sven>
References: <4ECA36CB.5010803@neotion.com>
	<1321879312.2085.18.camel@sven>
Message-ID: <20111121134405.02151918@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 21 Nov 2011 13:41:52 +0100,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> If this device requires firmware to be uploaded, then you most
> probably need to have udev running. The udev daemon should then take
> care of uploading the firmware when the module is loaded.

Note that Busybox mdev is also capable of pushing firmwares to the
kernel. FEATURE_MDEV_LOAD_FIRMWARE needs to be enabled in the Busybox
configuration, though, and it is not part of the default Busybox
configuration we have in Buildroot, so it requires manual tweaking.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
