From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Oct 2011 09:26:38 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111017184718.71afc290@skate>
References: <20111017184718.71afc290@skate>
Message-ID: <20111018072638.GF7761@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Oct 17, 2011 at 06:47:18PM +0200, Thomas Petazzoni wrote:
> At ELCE, I will be talking about "Using Buildroot for real projects".
> You can see my talk summary at
> https://events.linuxfoundation.org/events/embedded-linux-conference-europe/petazzoni.
> 
> The current (unfinished) status of my slides is visible at:
>   http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
> 
> The goal of the talk is to give some recommendations and best practices
> on how to use Buildroot. As I'm sure I forgot a lot of things in my
> slides above, I'd like to know what you, Buildroot developers/users,
> would have to say on the topic, so that I can improve the contents of
> this presentation.

A few comments.

1. Slide 7: maybe elaborate a bit on the meaning of "It does not track which 
   package installs what", i.e. you can't uninstall (or install) a package 
   form the target.

2. Slide 14 header: maybe "External toolchains: HOWTO"

3. Slide 19: the sysroot copying stage seems to be missing

4. Slide 22: the 'echo' command is missing '-e'?

5. Slides 23-26: headers should be "... (x/5)"

6. Slide 27: old style CMAKETARGETS

By the way, is there a link to the TeX (or DocBook?) source of this 
presentation.  I'd really like to learn a few Beamer tricks, like the source 
box in slides 17, 18.

baurch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
