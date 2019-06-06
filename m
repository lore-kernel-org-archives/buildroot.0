From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:07:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpsd: fix
 BR2_PACKAGE_GPSD_MAX_{CLIENT, DEV} options
In-Reply-To: <20190525135241.9208-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 25 May 2019 15:52:41 +0200")
References: <20190525135241.9208-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhmuiwgx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > limited_max_clients and limited_max_devices have been renamed in 3.12
 > as max_clients and max_devices, respectively.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
