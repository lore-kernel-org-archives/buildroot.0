From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Nov 2013 09:46:14 +0100
Subject: [Buildroot] [PATCH v3 3/5] eudev: new package.
In-Reply-To: <CAAXf6LWoRXOwzG2RaNSZc+EN4Ev7bJx_hrsgXFuD1Fa5hs8OjA@mail.gmail.com>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1383752078-25315-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20131113234133.2b964da0@skate>
 <CAAXf6LWoRXOwzG2RaNSZc+EN4Ev7bJx_hrsgXFuD1Fa5hs8OjA@mail.gmail.com>
Message-ID: <20131118084612.GA13924@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Sun, Nov 17, 2013 at 09:16:26AM +0100, Thomas De Schampheleire wrote:

> As making the difference between 'does the package itself also needs
> this dependency' or 'only the package dependencies have this
> dependency' is not obvious, having different rules in this matter
> creates a difficult to maintain situation IMO. Therefore, I am more in
> favor of duplicating the dependencies consistently, along with the
> comments.

Thanks for clarifying. I'll duplicate the dependencies and the comments
in the next series.
