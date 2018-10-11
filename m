From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 20:16:59 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <40fb0474-283f-4b73-78e6-45ea99a1bb65@mind.be> (Arnout
 Vandecappelle's message of "Thu, 11 Oct 2018 14:39:15 +0200")
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com>
 <20181010212630.7f47270e@windsurf> <20181010202425.GN2869@scaer>
 <40fb0474-283f-4b73-78e6-45ea99a1bb65@mind.be>
Message-ID: <87in281h7o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  'imply' is syntactic sugar for 'default y if ...'. The *only* thing it changes
 > is the place where you put the imply. (To be exact, it is the same as 'default
 > ...' because it propagates the m/y/n state to the default, not just y/n. But
 > since we don't use m, it doesn't matter.)

 >  For this specific case, it is pretty obvious that putting a 'default y if
 > BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' on BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 > would be crazy. On the other hand, adding the imply in webkitgtk looks nice,
 > concise and clear.

Exactly, which is why I suggested it to Adrian.

-- 
Bye, Peter Korsgaard
