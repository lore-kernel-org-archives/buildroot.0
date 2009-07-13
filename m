From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jul 2009 12:44:31 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <1247476399.4007.13.camel@sven> (Sven Neumann's message of "Mon\,
	13 Jul 2009 11\:13\:19 +0200")
References: <1247473258.4007.7.camel@sven> <1247476399.4007.13.camel@sven>
Message-ID: <87ljms981c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> On Mon, 2009-07-13 at 10:20 +0200, Sven Neumann wrote:

 >> the attached patch adds the buildroot config option
 >> BR2_PACKAGE_WPA_SUPPLICANT_DBUS. With this option enabled the DBus
 >> specific files from wpa_supplicant will be installed to the target and
 >> support for the DBus control interface will be compiled into
 >> wpa_supplicant. Please consider to include this patch.

 Sven> After updating our copy of buildroot to the latest snapshot, I found
 Sven> that the patch does not any longer apply cleanly. Attached is an updated
 Sven> patch that does.

Thanks, but do we really need a special option for this? Shouldn't
this just always be done if you have dbus enabled?

Similiar to how openssl support is handled in various packages
(E.G. libcurl).

-- 
Bye, Peter Korsgaard
