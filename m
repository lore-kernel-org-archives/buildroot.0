From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:17:21 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-bluezero: depends on
 dbus-python and python-gobject
In-Reply-To: <20210208005546.482866-1-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Mon, 8 Feb 2021 01:55:42 +0100")
References: <20210208005546.482866-1-grzegorz@blach.pl>
Message-ID: <87r1hdwf1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > As of version 0.4.0 observer.py uses dbus-python (to comunicate with BlueZ)
 > instead of python-aioblescan. Thus, all modules now depend on dbus-python.

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
