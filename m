From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Jul 2021 04:01:08 -0600
Subject: [Buildroot] [PATCH v2 1/1] {linux,
 linux-headers}: bump 5.13 to 5.13.2
In-Reply-To: <20210716230952.38662412@windsurf>
References: <20210716010020.3295725-1-james.hilliard1@gmail.com>
 <20210716230952.38662412@windsurf>
Message-ID: <CADvTj4oUWPyQjasnxgfiGyWK4krMTb6y2bq1N3gwb-XciZK8RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 16, 2021 at 3:09 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 15 Jul 2021 19:00:20 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - also bump headers
> > ---
> >  linux/Config.in                      | 2 +-
> >  linux/linux.hash                     | 2 +-
> >  package/linux-headers/Config.in.host | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
>
> Thanks for new version, however I'm afraid this lacks an update to
> linux-headers.hash :-/

Isn't that just a symlink?
$ ls -laht package/linux-headers/linux-headers.hash
lrwxrwxrwx 1 buildroot buildroot 22 Feb 24  2019
package/linux-headers/linux-headers.hash -> ../../linux/linux.hash

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
