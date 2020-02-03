From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 22:50:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez_utils: drop package
In-Reply-To: <20200112220839.3720326-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Jan 2020 23:08:39 +0100")
References: <20200112220839.3720326-1-fontaine.fabrice@gmail.com>
Message-ID: <871rrb1gsg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > BlueZ 4.x is deprecated since a long time (BlueZ 5.x has been released
 > in 2012) so drop it.

 > For cwwiid, sconeserver and ussp-push, replace bluez_utils by
 > bluez5_utils. All other packages already support bluez5_utils so just
 > drop bluez_utils.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

..

 > +++ b/package/bluez-tools/bluez-tools.mk
 > @@ -4,33 +4,13 @@
 >  #
 >  ################################################################################
 
 > -ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 > -# this is the last version compatible with BlueZ 4 API
 > -BLUEZ_TOOLS_VERSION = 171181b6ef6c94aefc828dc7fd8de136b9f97532

Dropped this line from the .hash file and committed, thanks!

-- 
Bye, Peter Korsgaard
