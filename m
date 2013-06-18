From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 17 Jun 2013 23:32:52 -0500
Subject: [Buildroot] Gstreamer1 Patches
In-Reply-To: <9486219.101301.1371528019334.JavaMail.nabble@joe.nabble.com>
References: <9486219.101301.1371528019334.JavaMail.nabble@joe.nabble.com>
Message-ID: <CAEBucnCg-iGRuJ+Em1U1fDchusErUj8uBA8stDXfXXbNrCGqtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas,

Please send emails to the list.  That way everyone benefits from the responses.

> I have been working with buildroot to make an image for the wandboard for a few weeks now. I am trying to get the gstreamer's opencv plugin to work.Therefore, I have tried multiple things like brute forcing the old gstreamer to work with the newer opencv in buildroot but it fails to load the opencv plugin. So then I tried to downgrade the opencv library but that just failed at compile. Now I want to update gstreamer instead and I found your patches which also enable opencv but I am not completely sure how I can apply your plugins to buildroot. I would really appreciate it if you could guide me on the right direction. Also, do you know if the gst-fsl-plugins work with gstreamer1?

So, IMHO the best way to apply them is to use a recent git checkout
and use git am to download and apply the patches in order.  You can
grab the patches from patchwork (need the mbox format for git am).

i know opencv compiles with the new gstreamer 1.X . However, I have
never used it in this manner.  It would be great if you could try it
out and see how it works!

I believe gst-fsl-plugins will not work with gstreamer 1.X (i.e.
gstreamer1) as it is a completely different api from gstreamer 0.10.x
(i.e. gstreamer).

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
