From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:02:51 +0200
Subject: [Buildroot] [PATCH 2/2] gst1-plugins-bad: update plugin licenses
In-Reply-To: <1525633443-942-2-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sun, 6 May 2018 15:04:03 -0400")
References: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
 <1525633443-942-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87k1rsdax0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Update several of the licenses annotated in the gst1-plugins-bad.mk file.
 > 1. Specify GPL-2.0 in license info.
 > * All of the *.[ch] that specify GPL also specify version 2 or later.

 > 2. Remove GPL from audiovisualizers.
 > * Changlog notes move from GPL to LGPL. (2015-04-25)
 > * docs/plugins/inspect/plugin-audiovisualizers.xml claims "LGPL".
 > * All *.[ch] files under ./gst/audiovisualizers says "GNU Library General Public License".

 > 3. Add GPL to yadif.
 > * Changelog notes that yadif is "GPL". (2013-02-07)
 > * docs/plugins/inspect/plugin-yadif.xml calims "GPL".
 > * All *.[ch] files under ./gst/yadif says "GNU General Public License"
 > except for one "GNU Library General Public License".

 > 4. Remove UNKNOWN from fdk_aac.
 > * docs/plugins/inspect/plugin-fdkaac.xml claims "LGPL".
 > * All *.[ch] files under ./ext/fdkaac says "GNU Lesser" or "GNU Library General Public License".

 > 5. Add BSD-2c to dtls.
 > * docs/plugins/inspect/plugin-dtls.xml calims "BSD".
 > * All *.[ch] files under ./gst/dtls has BSD-2c text.

 > 6. Add BSD-2c to openh264.
 > * Changelog notes that openh264 is "BSD-2". (2014-10-03)
 > * docs/plugins/inspect/plugin-openh264.xml calims "BSD".
 > * All *.[ch] files under ./ext/openh264 has BSD-2c text.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
