From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:26:41 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: waylandsink needs
	wayland-protocols
In-Reply-To: <20170306204347.30354-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 6 Mar 2017 21:43:47 +0100")
References: <20170306204347.30354-1-ps.report@gmx.net>
Message-ID: <87k2761jvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ----
 > Changes v1 -> v2:
 >   - use select instead of depends for BR2_PACKAGE_WAYLAND_PROTOCOLS
 >    (suggested by Thomas Petazzoni)
 >   - add select BR2_PACKAGE_WAYLAND_PROTOCOLS to missing second
 >     place (BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND)

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
