From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 27 Nov 2009 20:11:09 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <87fx7z6bt3.fsf@macbook.be.48ers.dk>
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
	<87eink70bd.fsf@macbook.be.48ers.dk> <op.u32e97xjyqa4qb@jap-lappis>
	<87k4xb6dk2.fsf@macbook.be.48ers.dk> <op.u32gvtv4yqa4qb@jap-lappis>
	<87fx7z6bt3.fsf@macbook.be.48ers.dk>
Message-ID: <op.u32h8vtpyqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Nov 2009 19:51:36 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

>>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:
>
> Hi,
>
>  >> [Please keep communication on the list instead of mailing me  
> directly]
>
>  Joachim> Sorry for that, the mailing list is set up with reply-to the  
> original
>  Joachim> author. I habitually do NOT send a reply-to-all, and I didn't  
> catch
>  Joachim> the  error until a few minutes after I sent it.
>
> OK. The reply-to setting is pretty much standard and done on purpose.
>
>  >> Failed in what way? Please provide more details so we can fix the
>  >> problem if there is one.
>
>  Joachim> ...
>  Joachim> flex installed:					Ok
>  Joachim> gettext installed:				Ok
>  Joachim> makeinfo installed:				Ok
>  Joachim> patch installed:				Ok
>  Joachim> Build system dependencies:			Ok
>
>  Joachim> rm -rf
>  Joachim>  
> /home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/buildroot-config
>  Joachim> mkdir -p  
> /home/jpihl/system_controller/buildroot-2009.11_rc1/output/build
>  Joachim> cp -dpRf package/config/buildroot-config
>  Joachim>  
> /home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/buildroot-config
>  Joachim> --2009-11-27 19:38:34--
>  Joachim>  
> http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.27.x.tar.bz2
>
> Ahh yes, you have to select 2.6.27.x in the choice box above instead of
> typing the string (Where you have now 'manually selected version')
>

No such setting in xconfig... Only 2.6.30, 2.6.31, snapshot and manual.


-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
