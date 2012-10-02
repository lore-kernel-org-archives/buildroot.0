From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Oct 2012 18:03:34 +0200
Subject: [Buildroot] Basic Qt questions
In-Reply-To: <1349111952.9619.YahooMailNeo@web164605.mail.gq1.yahoo.com>
References: <1349111952.9619.YahooMailNeo@web164605.mail.gq1.yahoo.com>
Message-ID: <CAGm1_ksSPpbhG_wkE5kofYFj_EyRU8-QKBSs4ZP5TP0w0x8wmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 1, 2012 at 7:19 PM, Zoran Djordjevic <djdjdjole@yahoo.com> wrote:
> I intend to use Qt library, by building  root file sistem with
> Qt support. If I build X (Tiny X), does it mean that Qt  will use that
> server ? As much as I understood Qt can run without X in embedded
> systems (am I right if I say that it must use X in desktop systems), but
> I am interested, if I can "force" it to use X, of course if it has
> advantages
> over "stand alone" use ?

Everything depends on what is your application/goal. If you're going
to use only one app, then Qt Embedded would fully sufficient. If
you're going to start many applications, then X11 would be better.
AFAIK Qt still has problems being called from X11, but my info is
about one year old or so.

Yegor
