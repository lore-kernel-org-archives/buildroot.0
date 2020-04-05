From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 5 Apr 2020 11:41:56 -0700
Subject: [Buildroot] [PATCH v7 3/4] package/python-pybind11: new host
 package
In-Reply-To: <CAMty3ZCoLiQmWLG36kU2ASJ0uk=GpJnvC46YJ2rNR4N+XwNBNg@mail.gmail.com>
References: <20200321190241.3590-1-jagan@amarulasolutions.com>
 <20200321190241.3590-4-jagan@amarulasolutions.com>
 <CALFsTFWUZaVntJKKxfBNOVgihs8eLmTU-YPZbdYswLZKuhhaYA@mail.gmail.com>
 <CAMty3ZBFR+3bvhgLdL6tfELbu4e4S7zqniaS=yKeuNccOQOUkg@mail.gmail.com>
 <CAFSsvmrE6Gc52iMC5=-QFJFtofqy_uu2mLezxBG=+zDbtRHgow@mail.gmail.com>
 <CAMty3ZCoLiQmWLG36kU2ASJ0uk=GpJnvC46YJ2rNR4N+XwNBNg@mail.gmail.com>
Message-ID: <CAFSsvmoS0kRZS2Y5OCpUvZvY3rrKvdq3NbAWVVOqLGE62V-z8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Fri, Apr 3, 2020 at 7:03 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Apr 3, 2020 at 12:35 PM Adam Duskett <aduskett@gmail.com> wrote:
> >
> > Hello;
> >
> > Feel free to also add my patch which tests pybind11 into your series:
> > https://patchwork.ozlabs.org/patch/1202658/
>
> As I said, this patch used pybind11 for host so are these tests common
> across host vs target? How can I test them?
>
The test compiles a simple C program and then uses a python program
with pybind11
to ensure that pybind11 is working properly.

Adam
> Jagan.
