From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:18:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bluezero: select dbus
In-Reply-To: <20210524185617.10260-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 24 May 2021 20:56:17 +0200")
References: <20210524185617.10260-1-fontaine.fabrice@gmail.com>
Message-ID: <87im2pwez5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build is broken since commit
 > 8bdc5e7c4d975193b1e18999ed840507cea63bd6 because BR2_PACKAGE_DBUS_PYTHON
 > is selected without selecting BR2_PACKAGE_DBUS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/378dd714940440b8f9db763479ae929e90e33b80

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
