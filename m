From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Wed, 10 Oct 2018 11:08:35 -0600
Subject: [Buildroot] [PATCH 1/1] libcorrect: add package
In-Reply-To: <20181010104650.39d03535@windsurf>
References: <20181009234649.19784-1-JoelsonCarl@gmail.com>
 <20181010104650.39d03535@windsurf>
Message-ID: <CA+1k=2bzfU_1G8COh0yYqe8zjhm1Hq7KLfxKN7rQ5xGGpB45XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2018 at 2:46 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue,  9 Oct 2018 17:46:49 -0600, Joel Carlson wrote:
> > Adds the libcorrect package. Libcorrect by default builds a shared
> > library, so require shared libraries. It also sets the -Wpedantic flag
> > in its Debug build, which first exists starting in gcc 4.8.
> >
> > Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> > ---
>
> After looking quickly at it, I decided to add a patch that uses
> -Wpedantic only if available, which allows to drop the dependency on
> the gcc version. The patch was submitted upstream.
>
> Applied with this change. Thanks!
>
> Thomas

Thank you for adding that patch/submitting it upstream.  I had already
made some other changes and took the lazy route of just excluding the
older toolchains instead of trying to fix that as well.
-Joel
