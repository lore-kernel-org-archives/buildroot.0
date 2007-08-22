From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 22 Aug 2007 16:14:44 +0100
Subject: [Buildroot] [PATCH] Qtopia4 improvements (resubmit)
In-Reply-To: <d6cda7730708220742j3d931627wd6e160071b5f9476@mail.gmail.com>
References: <d6cda7730708220742j3d931627wd6e160071b5f9476@mail.gmail.com>
Message-ID: <d6cda7730708220814p19be8433w3d97a252fae5ab10@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Btw, we should also consider updating to Qtopia 4.2.3 or 4.3.1.

The 4.2.3 fixes memory leaks and data corruption bugs.

On 8/22/07, Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
> Hi,
>
>     I have attached a patch sent earlier by Hans-Christian Egtvedt
> (http://buildroot.uclibc.org/lists/buildroot/2007-August/004197.html)
> using unified diff (easier to apply) and with a little improvement of
> my own.
>
>    Basically, this adds GIF and MMG support, fix comments a little
> bit, small cleanups, and avoid building Qtopia examples (that's my
> little improvement over the original). Thus, it builds a lot faster.
>
> Cheers,
>     Thiago A. Correa
>
>
