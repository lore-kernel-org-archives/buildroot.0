From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 7 Jun 2013 12:09:13 +0200
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <CAHXCMMKsjheubMqTfZ4QS+heh-AGMDB+a_i0taxi+kx59=v3JA@mail.gmail.com>
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMMJgpbTstcZyUOnz2dsAFpWvZNhGgSdHggPNfHfR3tMPjA@mail.gmail.com>
 <20130529171711.412e5b4c@skate> <20130607085719.GH14209@lukather>
 <CAHXCMMKsjheubMqTfZ4QS+heh-AGMDB+a_i0taxi+kx59=v3JA@mail.gmail.com>
Message-ID: <20130607100913.GM14209@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 07, 2013 at 11:52:07AM +0200, Samuel Martin wrote:
> Here are few diffs on the target dirs of the builds I run few days ago [1,2].
> 
> As you can see, in [2], most of the diff is due to the removal of:
> - tk/idle
> - 2to3 stuff
> - tests

Ah yes, idle and 2to3 are configurable with these patches, but this
option is not exposed in Kconfig, so they never get compiled in (which I
forgot about).

Maxime
