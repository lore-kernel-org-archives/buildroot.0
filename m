From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Dec 2011 07:38:14 +0200
Subject: [Buildroot] OT: Using oprofile
In-Reply-To: <CAMP44s0oPqwswyMRMTV+aSnLNQQZRsmG+XVJB1kwgwyPEDS-Kg@mail.gmail.com>
References: <4EB19B97.10902@carallon.com>
 <CAMP44s0oPqwswyMRMTV+aSnLNQQZRsmG+XVJB1kwgwyPEDS-Kg@mail.gmail.com>
Message-ID: <20111201053814.GA15878@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Felipe

On Wed, Nov 30, 2011 at 06:33:12PM +0200, Felipe Contreras wrote:
> On Wed, Nov 2, 2011 at 9:35 PM, Will Wagner <will_wagner@carallon.com> wrote:
> > I know this is slightly off topic, but I assume some buildroot users must be
> > doing this...
> >
> > I want to use oprofile on my target, which I have the basics working (using
> > buildroot master). However I am having two problems which I am not sure how
> > to work around:
> >
> > - when trying to profile with vmlinux it fails saying objdump is not
> > installed (which it is not). It says I can pass in the kernel range, I'm
> > just not sure how to get it.
> 
> You can read the soucecode, objdump is a shell script. Check
> get_image_range() and run the objdump commands on your machine.

You probably meant to say "opcontrol is a shell script".

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
