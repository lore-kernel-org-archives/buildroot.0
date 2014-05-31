From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 31 May 2014 23:18:43 +0200
Subject: [Buildroot] [PATCH 0/11 RFC] Add list of virtual packages to
	manual (branch yem/manual)
In-Reply-To: <cover.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJmE0imToa-Veb5E+SDxYy2Hu-j6Le+8GB9_EH92vG=8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann , all,

On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Hello All!
>
> This series intend to add the list of virtual pacakges to the manual, for

s/intend/intends/
s/pacakges/packages/
I know you already starting fixing the typos ;)

> three reasons:
>
>   - for users that are told (in a comment in the menuconfig) that a
>     pacakage they need depends on a virtual pacakge, to know what provider

s/pacakge/package/g

>     to select,
>
>   - for people writing a new provider for an existing virtual package to
>     have a reference of which symbol to select and which package to provide
>     in their Config.in and .mk files,
>
>   - for people writing a new package that depends on features provided by
>     a virtual pacakge to know what symbol to depend on.

s/pacakge/package/

>
> The series starts with some preparatory changes and cleanups, then
> introduces a away to generate different forms of tables, then goes on by
> removing virtual packages from the current lists, and finally add a new
> list with the virtual packages.
>
> I consider this to be in RFC stage for now, especially as I would like
> some feedback on the changes I made on the Python script, changes which
> were done in an ad-hoc fashion, until it works, but will probably need
> some more love to be clean.
>
> Special thanks to Samuel for his pythonistic help! :-)

You're welcome! :-)

Regards,

-- 
Samuel
