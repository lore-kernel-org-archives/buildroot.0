From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 8 Jun 2021 22:11:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind fix version number
In-Reply-To: <87pmww4sp7.fsf@tarshish>
References: <20210608085332.19296-1-br015@umbiko.net> <87pmww4sp7.fsf@tarshish>
Message-ID: <YL/O5HeH9yWaZzS0@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> Hi Andreas,

> On Tue, Jun 08 2021, Andreas Ziegler wrote:
> > Commit d13b292cec8166c4712cf4a0defbeee827ffaf78 introduced a patch for
> > rpcbind but also changed the version number to a non-existing value.

> > Change rpcbind to last released version and adapt hash value. 

> > Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> > ---
> >  package/rpcbind/rpcbind.hash | 2 +-
> >  package/rpcbind/rpcbind.mk   | 2 +-

> The comment in 0001-Remove-yellow-pages-support.patch also mentions this
> non existing version number.
+1

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for fixing my error.

Kind regards,
Petr

> baruch
