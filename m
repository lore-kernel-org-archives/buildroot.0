From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 00:03:40 -0800
Subject: [Buildroot] [PATCH v3] gstreamer: Added option to disable
	plugin registry.
In-Reply-To: <1353929164-7292-1-git-send-email-tim.sheridan@imgtec.com> (Tim
 Sheridan's message of "Mon, 26 Nov 2012 11:26:04 +0000")
References: <1353929164-7292-1-git-send-email-tim.sheridan@imgtec.com>
Message-ID: <87boefcyar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tim" == Tim Sheridan <tim.sheridan@imgtec.com> writes:

 Tim> The plugin registry can take a while to be generated when GStreamer is
 Tim> initialized. Turning it off can speed up up GStreamer application launch
 Tim> times. Default behaviour is unchanged.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
