From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 16:53:52 +0100
Subject: [Buildroot] [PATCH 1/4] graph-build-time: generate graphs based
 on timing data
In-Reply-To: <20131228162642.1ce399d4@skate>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <ea00abe7d4b0119c4614f581bc26d0655ea3c576.1388185918.git.yann.morin.1998@free.fr>
 <20131228162642.1ce399d4@skate>
Message-ID: <20131228155352.GE3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 16:26 +0100, Thomas Petazzoni spake thusly:
> On Sat, 28 Dec 2013 00:12:49 +0100, Yann E. MORIN wrote:
> 
> > Example usage:
> > 
> >   cat $(O)/build-time.log | \
> >       ./support/scripts/graph-build-time \
> >       --type=histogram --output=foobar.pdf
> 
> I'm wondering: since the script has a --output/-o option, would it make
> more sense to have a --input/-i option instead of passing the
> build-time.log contents on the standard input?

Agreed. If no --input is specified, then read stdin, otherwise, read
file specified with --input.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
