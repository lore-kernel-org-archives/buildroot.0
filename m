From: Sam Voss <sam.voss@gmail.com>
Date: Sun, 6 Oct 2019 14:02:16 -0500
Subject: [Buildroot] [PATCH v2] package/ripgrep: new package
In-Reply-To: <20191006155649.GD5258@ned>
References: <20191003003146.942555-1-sam.voss@gmail.com>
 <20191006155649.GD5258@ned>
Message-ID: <CAK714xLr0c-4UNp+_F8YQNavXa+Lr97=CTznyJqKxzFitJ4QHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

On Sun, Oct 6, 2019 at 10:56 AM Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
>
> Hi!
>
> On 2019-10-02 19:31, sam.voss at gmail.com wrote:
> > From: Sam Voss <sam.voss@gmail.com>
> >
> > Signed-off-by: Sam Voss <sam.voss@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - Fix depends-on values
> >   - Add hash for license files
> >   - Make indentation consistant
>
> A bit late, but LGTM. In my own version [1], I added
> '--jobs=$(PARALLEL_JOBS)' to $(RIPGREP_CARGO_OPTS), but in the end, it
> seems useless.
>
> Now that there is one package using Cargo in Buildroot, should the
> pkg-cargo infrastructure be added?
>
> [1] https://github.com/elebihan/br2-ext-rust/tree/master/package/ripgrep

It looks like this project is private. I went to take a look at it,
and got a 404.

Sam
