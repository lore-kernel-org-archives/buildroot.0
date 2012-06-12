From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 11 Jun 2012 20:03:38 -0400
Subject: [Buildroot] [PATCH] New package: cJSON (v2)
In-Reply-To: <87txyif9f7.fsf@macbook.be.48ers.dk>
References: <1338856703-4082-1-git-send-email-danomimanchego123@gmail.com>
 <87txyif9f7.fsf@macbook.be.48ers.dk>
Message-ID: <CANxTyt7PWShWW=7KcysmHxNAQUogw=8fb=+JRDfZuiVAwrQ_Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

> I'm not sure it makes sense to build a .so of something as simple (and
> unversioned) as this. How about just doing a static .a like ezxml?

We use cJSON in about half a dozen apps in our project, so a .so seemed
like the way to go.  If you feel strongly about this, would you be open to
having an option to make a shared object?  (Maybe something like the
logic in zlib.mk or qt.mk.)

> You also shouldn't hardcode compiler flags like -Wall / -O2 but use
> $(TARGET_CFLAGS) instead - E.G.

Understood, will adjust.

> You should also install the header file into TARGET_DIR. It will get
> removed by target-finalize if it isn't needed.

Ah, I didn't know that.  Nice!

> Care to fix and resend?

Certainly - after hearing your feedback on the .so/.a question.

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120611/9411f836/attachment.html>
