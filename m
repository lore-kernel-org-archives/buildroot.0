From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Oct 2019 09:14:34 +0100
Subject: [Buildroot] [PATCH v3 2/2] support/dependencies: set cmake
 version min to 3.10
In-Reply-To: <CADvTj4ogtkEUeUnxjgZBThTK=LNPpeuxqnXf__pG4wW5EX9cCQ@mail.gmail.com>
References: <20191012131304.13283-1-james.hilliard1@gmail.com>
 <20191012131304.13283-2-james.hilliard1@gmail.com>
 <20191012135916.GX10860@scaer>
 <CADvTj4ogtkEUeUnxjgZBThTK=LNPpeuxqnXf__pG4wW5EX9cCQ@mail.gmail.com>
Message-ID: <20191030081434.GA2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-10-29 19:37 -0400, James Hilliard spake thusly:
> On Sat, Oct 12, 2019 at 9:59 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2019-10-12 07:13 -0600, James Hilliard spake thusly:
> > > This is required by wpewebkit and webkitgtk.
[--SNIP--]
> > I am not saying we do not want this, but the bump should not be lightly
> > applied. It has consequences.
> Since we have now bumped the requirements can this be merged as is?

As far as I know, this has been applied already:

    commit d4773b610a40be1d3ac7d793033abaf4eb2491ed
    Author:     James Hilliard <james.hilliard1@gmail.com>
    AuthorDate: Sat Oct 12 07:13:04 2019 -0600
    Commit:     Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    CommitDate: Mon Oct 28 23:01:47 2019 +0100

        support/dependencies: set cmake version min to 3.10

        This is required by wpewebkit and webkitgtk.

        Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
        Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
        Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
