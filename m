From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 19 Jul 2011 09:39:29 +0200
Subject: [Buildroot] pending patches (gstreamer, gvfs, shared-mime-info,
	...)
In-Reply-To: <87wrff4750.fsf@macbook.be.48ers.dk>
References: <1311020996.382.5.camel@bender>
 <87wrff4750.fsf@macbook.be.48ers.dk>
Message-ID: <1311061169.2141.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, 2011-07-18 at 23:21 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> I didn't look at the gstreamer/orc patches yet, and there's been quite
> some discussions / different versions posted. Which ones are now the
> final versions?

I've split the gstreamer patches up into two batches:

One is about cleaning up the configuration options. You will find three
patches following up to the mail with subject "update gstreamer plug-ins
configuration" dated Thu, 14 Jul 2011:

  gst-plugins-good: update configuration options
  gst-plugins-ugly: update configuration options
  gst-plugins-ugly: fix dependencies for mad MP3 decoder plug-in

The other batch deals with adding the orc package. The final versions
are follow-ups to the mail with subject "new package: orc" also from
Thu, 14 Jul 2011:

  orc: new package
  gst-plugins-base: depend on orc if it is enabled


Thanks,
Sven
