From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2012 18:31:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: add pkg-config file
In-Reply-To: <20120821111439.1a46d367@skate>
References: <1345294543-13671-1-git-send-email-yann.morin.1998@free.fr>
 <20120821111439.1a46d367@skate>
Message-ID: <201208211831.57392.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 21 August 2012 11:14:39 Thomas Petazzoni wrote:
> Le Sat, 18 Aug 2012 14:55:42 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > Some packages use pkg-config to check for libnspr.
> > libnspr does bundle a .pc file, but it is not installed.
> 
> Here you're saying that libnspr bundles a .pc file... but
> 
> > diff --git a/package/libnspr/nspr.pc.in b/package/libnspr/nspr.pc.in
> > new file mode 100644
> > index 0000000..3719260
> > --- /dev/null
> > +++ b/package/libnspr/nspr.pc.in
> 
> here you're adding it to Buildroot. I'm confused. Could you explain? :-)

Bah, I guess I was cafeine-deprived when I wrote this... libnspr does *not*
bundle a .pc file. I don't know where I saw one: I just re-extracted the
sources, and there's clearly no pkg-config file in there...

I'll reword the commit message and resubmit.

Thanks for the review.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
