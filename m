From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:21:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: select gstreamer
 autoaudiosink
In-Reply-To: <20210519213237.1286906-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 20 May 2021 00:32:37 +0300")
References: <20210519213237.1286906-1-aperez@igalia.com>
Message-ID: <875yypwets.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT when multimedia
 > support is enabled. This is needed at runtime to automatically select
 > a suitable audio output element, otherwise WebKit will crash at an
 > assertion due to the missing "autoaudiosink" element. More here:

 >   https://wpewebkit.org/about/faq.html#why-does-the-browser%2Flauncher-(e.g.-cog)-crash-when-trying-to-play-audio%3F

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
