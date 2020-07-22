From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 11:06:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: disable
 introspection
In-Reply-To: <20200715203442.956892-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 15 Jul 2020 22:34:42 +0200")
References: <20200715203442.956892-1-fontaine.fabrice@gmail.com>
Message-ID: <87ft9jj4uz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build will fail if gobject-introspection is built before network-manager
 > but python-gobject is not:

 > configure: error: "--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)

 > To avoid this build failure and because we don't need documentation,
 > just disable introspection

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d3b1bc2fa7559e66465033c455176761d6e184d1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
