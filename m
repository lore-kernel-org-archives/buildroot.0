From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 4 Oct 2019 10:49:18 +0200
Subject: [Buildroot] [PATCH 3/9] package/libredblack: add package
In-Reply-To: <20191002092033.58e3f41c@windsurf.home>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-3-heiko.thiery@gmail.com>
 <20191002092033.58e3f41c@windsurf.home>
Message-ID: <CAEyMn7aEYvM2=NqGDjVOrO=oTQD0cC3V7TZ6b=Pu79f0maqiNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The Github page says "
> Copy of RedBlack Balanced Tree Searching and Sorting Library -
> http://libredblack.sourceforge.net/". Does it make sense to use the
> original version from SourceForge instead ?

While taking a look into that we figured out that a (maybe more
common) lib called libavl can also be used for building the sysrepo.

Therefore now we will provide a package for that libavl instead of the
libredblack. This libavl is also used in debian so we think it is
better maintained.
