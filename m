From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 10:44:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: new
 package
In-Reply-To: <4106e322c7a21137383f4aa10f70f7aa0c8abc65.camel@wiedemann-group.com>
 (Michel Alex's message of "Tue, 4 Feb 2020 08:33:07 +0000")
References: <8b51f7b227fd3cef7bc968a0c4f0eebd018d6655.camel@wiedemann-group.com>
 <87h8073fdt.fsf@dell.be.48ers.dk>
 <4106e322c7a21137383f4aa10f70f7aa0c8abc65.camel@wiedemann-group.com>
Message-ID: <874kw6ofdw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel Alex <Alex.Michel@wiedemann-group.com> writes:

 > This package provides OpenVPN plugin for network manager
 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

 > ---
 > Changes v1 -> v2:
 >   - add openvpn dependency (suggested by Peter Korsgaard)
 >   - removed INSTALL_STAGING from network-manager-openvpn.mk (suggested
 > by Peter Korsgaard)
 >   - provide component in the main package instead of including it from
 > the Config.in of the main package (suggested by Peter Korsgaard)
 > ---
 >  .../network-manager-openvpn.hash              |  4 ++++
 >  .../network-manager-openvpn.mk                | 22 +++++++++++++++++++
 >  package/network-manager/Config.in             |  8 +++++++
 >  3 files changed, 34 insertions(+)
 >  create mode 100644 package/network-manager-openvpn/network-manager-
 > openvpn.hash
 >  create mode 100644 package/network-manager-openvpn/network-manager-
 > openvpn.mk

 > diff --git a/package/network-manager-openvpn/network-manager-
 > openvpn.hash b/package/network-manager-openvpn/network-manager-
 > openvpn.hash
 > new file mode 100644
 > index 0000000000..0c52fb8d13
 > --- /dev/null
 > +++ b/package/network-manager-openvpn/network-manager-openvpn.hash
 > @@ -0,0 +1,4 @@
 > +# From 
 > https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.10.sha256sum
 > +sha256
 > af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef  Netwo
 > rkManager-openvpn-1.8.10.tar.xz

Sorry, but the patch is badly wrapped by your mailer, so it cannot be
applied. Can you send it with git send-email? If that doesn't work, the
please attach it instead.

-- 
Bye, Peter Korsgaard
