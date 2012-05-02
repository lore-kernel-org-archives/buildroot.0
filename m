From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 May 2012 07:13:03 +0300
Subject: [Buildroot] Enabling debugging symbols in packages..
In-Reply-To: <CAC2kKA8s_8d=u2BDz4Ai0GA_QEru6+76dY3=0_3=s75jjK=QxA@mail.gmail.com>
References: <CAC2kKA8s_8d=u2BDz4Ai0GA_QEru6+76dY3=0_3=s75jjK=QxA@mail.gmail.com>
Message-ID: <20120502041303.GA31267@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Shawn,

On Tue, May 01, 2012 at 07:19:40PM -0600, Shawn Ferris wrote:
> I'm trying to get help to debug pulseaudio on my pandaboard and I'm
> trying to enable debugging symbols to grab a backtrace. I see -g2
> added to the CFLAGS, but when I gdb pulseaudio, it can't find them:

Target binaries get striped after build, thus removing debugging info. To 
disabled this behaviour go to "Build options" -> "strip command for binaries 
on target", and select "none".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
