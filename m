From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 17:21:28 +0200
Subject: [Buildroot] Why there are two colons on .stamp_built rule?
In-Reply-To: <CALFsTFWzzN2reVfT26bKF0qmYWOZxHJshMNpuB7HhHSXm2-_kA@mail.gmail.com>
References: <CALFsTFWzzN2reVfT26bKF0qmYWOZxHJshMNpuB7HhHSXm2-_kA@mail.gmail.com>
Message-ID: <20200410172128.02c2f4f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 18:12:07 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> I was looking for something in pkg-generic.mk and then I noticed that
> the rule for .stamp_built has two colons.
> 
> This is the line:
>   $(BUILD_DIR)/%/.stamp_built::
> 
> Is it on purpose or it's just a simple harmless mistake? Do the two
> colons even mean something?

It has apparently always been like this since I introduced the generic
package infrastructure back in commit
e11fe847b2f545446fc3300dd2ba88fd5da05756 (wow, that's from November
2009, more than 10 years ago). To me, it feels like a mistake.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
