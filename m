From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 21:27:04 +0100
Subject: [Buildroot] out-of-tree kernel modules and linux header versions
In-Reply-To: <CAJpxd04tNrVAiT4AC0ojA75pH9q9TYU6XtezqyTNWNJh8LSkwg@mail.gmail.com>
References: <CAJpxd07isuV8UB+d2pWCjoYsdWnG7T5XM_Hm6vxyrTJi_gz9DQ@mail.gmail.com>
 <CAJpxd06Luke+9Jgd7+Ka68yUwUh1Lxu93dfhJcG_-LzZ+irVqA@mail.gmail.com>
 <20141113092025.4bc7cfe2@free-electrons.com>
 <CAJpxd04tNrVAiT4AC0ojA75pH9q9TYU6XtezqyTNWNJh8LSkwg@mail.gmail.com>
Message-ID: <20141113212704.74b96059@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bryce Schober,

On Thu, 13 Nov 2014 09:03:07 -0800, Bryce Schober wrote:

> I would, if it *were* simple. Because my target is tied to *very* old
> kernel and certain packages, especially Xorg, it is not at all simple. The
> infrastructure around Xorg and opengl has changed a lot since 2011.08, and
> backporting the extensive list of xorg and related packages would be a lot
> of work. Or at least I think it would be... maybe I'm being too
> pessimistic. Don't get me wrong, I'd love to spend the time to get
> up-to-date and get all the benefits of recent development. But I'm sure you
> know how competing priorities go...

Aah, yes, I now remember. Due to a proprietary graphics driver, you
have to use an old X.org version and an old kernel. Using an old kernel
is fairly easy, but using an old X.org version is more problematic.
Unfortunately, that's not something for which I see an easy solution in
Buildroot :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
