From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 13:13:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/mosquitto: extend systemd
 integration
In-Reply-To: <20190803093858.144555-3-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 3 Aug 2019 11:38:57 +0200")
References: <20190803093858.144555-1-titouan.christophe@railnova.eu>
 <20190803093858.144555-3-titouan.christophe@railnova.eu>
Message-ID: <87h86yec28.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Since version 1.5, mosquitto can be built with explicit support for
 > systemd. If enabled, libmosquitto will link against libsystemd: when
 > started, the mosquitto broker notifies systemd that it is ready (ie.
 > initialized and ready to accept connections), so that services that
 > depend on the mqtt broker can be started only at that point.

 > To enable this feature, the systemd service config file needs to change
 > to Type=notify. Upstream now provides such a file, so we can remove
 > ours.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
