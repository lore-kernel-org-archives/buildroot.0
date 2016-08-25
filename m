From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Aug 2016 09:41:45 +0200
Subject: [Buildroot] Clone source code recursively
In-Reply-To: <CAMkMO5mqkfSz8ky1Ry05m2Z3aT9PXsNiNSjFvNMpu87GCnx03Q@mail.gmail.com>
References: <CAMkMO5mqkfSz8ky1Ry05m2Z3aT9PXsNiNSjFvNMpu87GCnx03Q@mail.gmail.com>
Message-ID: <20160825074145.GA6209@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zygmunt, All,

On 2016-08-25 01:31 +0200, Zygmunt Ptak spake thusly:
> I can't find how can I clone code recursively from git repository.
> Is it possible at all?
> 
> I found interested lines in: support/download/git
> But I don't know how to set recursive method in .mk file.

The official manual references the last release, so all that has been
added in not visible in there.

You can browse the "nightly" manual that has the necessary information.
Just Choose "Nightly" instead of "stable" when selecting the manual to
browse.

There it is:
    http://nightly.buildroot.org/#generic-package-reference

Then, search for LIBFOO_GIT_SUBMODULES.

Once 2016.08 is released, this will be part of the official, stable
manual. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
