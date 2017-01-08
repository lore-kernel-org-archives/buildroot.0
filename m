From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Jan 2017 21:56:09 +0100
Subject: [Buildroot] [PATCH] efl: optional 'upower' ecore system module.
In-Reply-To: <20161230145104.20804-1-barbieri@profusion.mobi> (Gustavo Sverzut
 Barbieri's message of "Fri, 30 Dec 2016 12:51:04 -0200")
References: <CAPdpN3BnRBvciT2GjvVDWa5gvWXFNyVxkA9b1X1VOrE2-hBPrg@mail.gmail.com>
 <20161230145104.20804-1-barbieri@profusion.mobi>
Message-ID: <877f65qniu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Sverzut Barbieri <barbieri@profusion.mobi> writes:

 > Ecore will reach 'upower' using D-Bus system bus in order to detect if
 > the system state changes and let applications know about the power
 > state such as low battery or AC power in order to optimize their power
 > consumption.

 > For host this is not needed and would not work, since output/host DBus
 > declares its own output/host/var/run/dbus/system_bus_socket, which has
 > no dbus-daemon and thus no services in it.

 > For target it's optional and only installed if BR2_PACKAGE_UPOWER=y,
 > otherwise it prints error messages about missing upower service.

 > Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>

Committed, thanks.

-- 
Bye, Peter Korsgaard
