From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:26:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: allow static
 build of zbar plugin
In-Reply-To: <20190305222807.18393-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2019 23:28:07 +0100")
References: <20190305222807.18393-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2b2fw4y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > zbar can be built statically since commit
 > fc4a6abfa6bbffeabefb9967dbf378c410fb6318 so remove the dynamic library
 > dependency from BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
