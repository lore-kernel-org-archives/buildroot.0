From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 May 2014 22:25:46 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] Using gdb in buildroot
In-Reply-To: <3babace9-ca13-4ca8-93c0-7968fde20fb0@email.android.com>
References: <patchbomb.1399126191@argentina> <20140503212047.545161a7@skate>
 <3babace9-ca13-4ca8-93c0-7968fde20fb0@email.android.com>
Message-ID: <20140503202546.GI10671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 2014-05-03 22:18 +0200, Thomas De Schampheleire spake thusly:
> hi Thomas,
> 
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
> >Dear Thomas De Schampheleire,
> >
> >On Sat, 03 May 2014 16:09:51 +0200, Thomas De Schampheleire wrote:
> >
> >> This a small respin of two patches that Thomas Petazzoni sent to the list a
> >> while back, adding a gdbinit file and updating the manual.
> >
> >Thanks for this update! However, it looks like you haven't preserved
> >the authorship on these patches, even though your modifications are
> >apparently relatively small. Is that intended?
> 
> I'm not sure what you mean.I left your original sob line and added mine below. Isn't this leaving the authorship with you?
> I thought this is the right strategy when sending even slightly modified patches of someone else. If this is incorrect, please clarify and accept my apologies...

What Thomas meant, you forgot to commit with:
  git commit --author='Thomas P. <...@...>'

when you adopted the patch, hence you are now credited as the author of
that patch, not the other Thomas.

That's a mistake that is easily done when using 'patch -p1 <file.patch'.

If you had been using 'pwclient am PATH-ID' instead, it would have kept
the authorship.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
