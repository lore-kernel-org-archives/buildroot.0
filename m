From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 22:52:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: select missing
 multimedia deps
In-Reply-To: <20210519213827.1291299-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 20 May 2021 00:38:27 +0300")
References: <20210519213827.1291299-1-aperez@igalia.com>
Message-ID: <87eedaoj4v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Select a few missing multimedia related dependencies:
 > - BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT is needed for
 >   "autoaudiosink"; not having this element can cause a crash as
 >   it is used unconditionally.
 > - BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA and
 >   BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX are needed for
 >   WebM video playback.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
