From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:25:52 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: fix avahi dependency
In-Reply-To: <20180510093500.15672-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 10 May 2018 11:35:00 +0200")
References: <20180510093500.15672-1-fontaine.fabrice@gmail.com>
Message-ID: <874liryhzj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > avahi support requires avahi-client, which needs avahi-daemon and dbus
 > Fixes:
 >  - http://autobuild.buildroot.net/results/5c326bb56199000eb0e53a4d0f3c6c13be71cda0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
