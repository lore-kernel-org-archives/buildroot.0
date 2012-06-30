From: Alex Bradbury <asb@asbradbury.org>
Date: Sat, 30 Jun 2012 18:09:38 +0100
Subject: [Buildroot] [git commit] mii-diag: link statically if
 configured to do so
In-Reply-To: <4FEEF8D4.4080702@mind.be>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate>
 <87txxt42up.fsf@macbook.be.48ers.dk>
 <20120630105559.7e57508a@skate> <4FEEF8D4.4080702@mind.be>
Message-ID: <CA+wH294UjT4T2a7_SNziD+VLeLAvzMNZxZmbyg+hz9CW+pg=zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 June 2012 14:02, Arnout Vandecappelle <arnout@mind.be> wrote:
> ?I expect that adding -static to LDFLAGS will break quite a few packages.
> Would it be possible to add a BR2_PREFER_STATIC_LIB test to the autobuilds?

That would be neat. Is there a list of currently tested configurations
somewhere?

There's certainly a decent amount of interest in static linking - e.g.
sta.li, bifrost, sabotage and others.

Alex
