From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 17:08:37 +0200
Subject: [Buildroot] [PATCH] syslinux: install helper programs to the
	host
In-Reply-To: <CA+-urNTJCR=8oiiKqj31GZ5Pw0+Q88sM0FfZ3QEzSy9nL9h0dQ@mail.gmail.com>
References: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
 <20140420115741.1cb6a1b2@skate>
 <CA+-urNQ8ME28j_cCfhYu=poEot8yFpEXexHce4iieV0rAbaeRA@mail.gmail.com>
 <20140421141313.GA3359@free.fr>
 <CA+-urNSGGG=sE7KXgOPBz_byTccxdg02mCJuWvcrhhY5Howrvg@mail.gmail.com>
 <20140421144028.GD3359@free.fr>
 <CA+-urNTJCR=8oiiKqj31GZ5Pw0+Q88sM0FfZ3QEzSy9nL9h0dQ@mail.gmail.com>
Message-ID: <20140421150837.GE3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2014-04-21 10:55 -0400, Frank Hunleth spake thusly:
> On Mon, Apr 21, 2014 at 10:40 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Frank, All,
> >
> > On 2014-04-21 10:30 -0400, Frank Hunleth spake thusly:
> >> On Mon, Apr 21, 2014 at 10:13 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> > As I am also working on this, if you just posted your changes (on the
> >> > list on in a public git tree), I can incorporate your changes I am
> >> > missing, and submit those.
> >>
> >> I've attached my current progress just in case there's something of
> >> use, but I suspect that you're farther along.
> >
> > Woot! :-) In fact, you are farther than me! I still did not had a need
> > for usl of upx.
> 
> Just a note, I've convinced myself that there's no way that upx will
> do the right thing on cross-compiled executables. I suspect that it
> will work on my x86 setup since the host and target are the same
> architecture, but not in general. I didn't get far enough to verify it
> though.

Well, syslinux is only for the x86 world anyway, and it is only
buildable on a x86 machine as well (since it uses the host compiler).

> > This patch is missing your SoB. Could you just resend with your SoB
> > added? Then I'll handle all the nitty-gritty work of finishing this, and
> > pushing upstream.
> 
> Done! And thanks. Let me know if I can help by testing anything in my setup.

Thanks for this bootstrap code! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
