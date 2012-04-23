From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Apr 2012 14:52:36 +0200
Subject: [Buildroot] [git commit] docs/header.html: Add link to patchwork
In-Reply-To: <CAAXf6LU6_NP78OFdjqBqgh-_FqOcHzk14SiOa3Q7G3a9veMHVA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 23 Apr 2012 14:46:22
 +0200")
References: <20120421111926.3558596B3A@busybox.osuosl.org>
 <CAAXf6LU6_NP78OFdjqBqgh-_FqOcHzk14SiOa3Q7G3a9veMHVA@mail.gmail.com>
Message-ID: <87obqihap7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> I did not see any other mention about this, and haven't been
 Thomas> active on IRC for a while, so I was happily surprised to see
 Thomas> this link (actually it was Yegor's resend of some patches that
 Thomas> triggered me, I hadn't seen this mail yet).

 Thomas> What is the plan exactly?

Basically like we discussed at the dev day:

http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html

E.G. I've set it up together with the ozlabs / osuosl guys, so we can
now start playing with it to se what works / what doesn't work for us.

 Thomas> Everyone can change the state of their own patches, e.g. to indicate
 Thomas> that they intend to send a new version based on feedback. But what
 Thomas> about delegating? When is it done? Will Peter delegate those patches
 Thomas> that he intends to accept to himself, or should developers that
 Thomas> consider their patches as 'final' delegate to Peter ?

I'm still very much a patchwork noob, so I don't quite know yet what's
possible / what work flow makes most sense.

To begin with I'll setup two things:

- Ensure patchwork doesn't think git commit mails are new patches (done)
- Ensure patchwork state gets updated whenever I push commits (still to
  be done)

-- 
Bye, Peter Korsgaard
