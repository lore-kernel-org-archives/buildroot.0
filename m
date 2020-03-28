From: Belisko Marek <marek.belisko@gmail.com>
Date: Sat, 28 Mar 2020 19:12:20 +0100
Subject: [Buildroot] friendlyarm neo4
In-Reply-To: <CAAfyv36FyrVcYtaEwC3J=JuhtnGg2TY0-XYvD7MtecYyL4UnSA@mail.gmail.com>
References: <CAAfyv36FyrVcYtaEwC3J=JuhtnGg2TY0-XYvD7MtecYyL4UnSA@mail.gmail.com>
Message-ID: <CAAfyv34+YfRy1E9zc-8nZxVQyJ817LkAXLRK0HdxM-tPdgfaCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 27, 2020 at 10:07 PM Belisko Marek <marek.belisko@gmail.com> wrote:
>
> Hi,
>
> I became owner of nanopi neo4 board and was looking around for some
> options how to run buildroot on this board. I discovered that BR have
> support for this board but was dropped in commit:
> 8af7b11bd8a95bc41e4de46f727f3b0afde465a4.
>
> Anyway I revert this commit and build an image but when flashed to
> SDcard console shows some garbage only and that's it. Anyone have this
> board working or am I missing something? Thanks.
I'm missing proper board reading of readme. Problme was baudrate on
serial console.
Sorry for noise.
>
> BR,
>
> marek

BR,

marek



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
