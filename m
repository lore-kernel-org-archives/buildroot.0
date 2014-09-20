From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:55:30 +0200
Subject: [Buildroot] [PATCH 01/10] package/libinput: bump version
In-Reply-To: <541DB8A4.4050008@openwide.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
 <c999e0a0cf43f65190bf74289b299b959557b0d0.1411232859.git.yann.morin.1998@free.fr>
 <541DB8A4.4050008@openwide.fr>
Message-ID: <20140920175529.GA18705@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-09-20 19:25 +0200, Romain Naour spake thusly:
> Hello Yann,
> 
> Le 20/09/2014 19:09, Yann E. MORIN a ?crit :
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  ...put-01-rename-log_msg-to-libinput_log_msg.patch | 54 +++++++++++++---------
> >  package/libinput/libinput.mk                       |  2 +-
> >  2 files changed, 32 insertions(+), 24 deletions(-)
> > 
> > diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
> > index c10d8af..2ada150 100644
> > --- a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
> > +++ b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
> > @@ -9,6 +9,8 @@ of the log_msg() symbol.
> >  http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
> >  
> >  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> > +[yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >  ---
> 
> I think this patch can be dropped with this new release.
> The issue is normally fixed by the commit "Use -no-install instead of -static
> for local noinst linking"
> 
> See: https://bugs.freedesktop.org/show_bug.cgi?id=82292
> (the bug was reported by Vicente)

Yep, I saw that bug. And I pondered removing the patch.

However, I was not able to test a static-only build, so I can't say
whether that patch is still valid or not.

Also, that patch merely renames a function.

When/if I have some time around the WE, I'll test whether it is still
needed.

So, I decided it would be better to just refresh it for now. If you or
Vicente have some time to test the new libinput without that patch, feel
free to report! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
