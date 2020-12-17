From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2020 22:49:02 +0100
Subject: [Buildroot] pycompile script doesn't compile files with single
 character names
In-Reply-To: <CAAV4SYaqA+gr-mS+Q=6AxhQH8hB14JAGhJ97gPPi0-C+3EYVeQ@mail.gmail.com>
References: <CAAV4SYZLndA0mHnZO6+9+YGaVKtPQwGYHxWi4=ckF67AzibDzw@mail.gmail.com>
 <CAHfJR7j8YdVLnYyXu7imzcnTC_9AcEnBwBi1BFFJTtqRNxXKGg@mail.gmail.com>
 <CAAV4SYaqA+gr-mS+Q=6AxhQH8hB14JAGhJ97gPPi0-C+3EYVeQ@mail.gmail.com>
Message-ID: <20201217214902.GF3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Caharles, Julien, All,

On 2020-12-17 06:58 -0500, Charles Eidsness via buildroot spake thusly:
> On Thu, 17 Dec 2020 at 03:22, Julien Floret <julien.floret@6wind.com> wrote:
> > Le mer. 16 d?c. 2020 ? 14:37, Charles Eidsness via buildroot
> > <buildroot@busybox.net> a ?crit :
[--SNIP--]
> > Could you send a git patch using "git
> > send-email", so that it can be applied by the maintainers?

Interestingly, this initial patch did get caught up in the patchowrk
list.

> I don't have git send-email setup but used git format-patch and sent
> out an email, hopefully it'll work.

I have now replied to that second iteration, thanks.

What I forgot to add is: add previous reviewers in Cc when you resend a
patch. You can do that by just adding Cc. in the patch commit log, jut
after your Signed-off-by. Keeping previous reviewers in Cc help them
keep track of resend, and look at it again (so they can eventually reply
with their reviewed-by tags, hint-hint Julien ;-) ).

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
