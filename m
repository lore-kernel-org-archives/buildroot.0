From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 12 Apr 2021 09:56:23 -0500
Subject: [Buildroot] [PATCH] package/bridge-utils: fix missing PATH_MAX
 include
In-Reply-To: <87o8ejimhc.fsf@tarshish>
References: <20210412143708.45721-1-matthew.weber@rockwellcollins.com>
 <87o8ejimhc.fsf@tarshish>
Message-ID: <CANQCQpYudpo_-DhSK5fDGxWuHMec_8bzMOqn8enHSa2DYBwxoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Mon, Apr 12, 2021 at 9:53 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Matt,
>
> On Mon, Apr 12 2021, Matt Weber wrote:
>
> > Fixes:
> > http://autobuild.buildroot.net/results/3ec818e676827c03f08c264c6c7a53b025b7ba1d/
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> Fabrice posted a patch for that already. It's committed as
> aa75b053baef70c9 ("package/bridge-utils: fix build on musl").

:-)  I was too slow.  Hopefully, the additional patch on bridge-utils
mailing list encourages it to merge.


Thx Matt
