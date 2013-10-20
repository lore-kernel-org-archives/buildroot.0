From: SPC <spedraja@gmail.com>
Date: Mon, 21 Oct 2013 00:41:48 +0200
Subject: [Buildroot] [PATCH] snmppp: new package
In-Reply-To: <87mwmboap7.fsf@dell.be.48ers.dk>
References: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LU9vZRc1B1MeO717yutvHHeZVv7hrYAC22XDrwY8JzPxA@mail.gmail.com>
 <87mwmboap7.fsf@dell.be.48ers.dk>
Message-ID: <CACytpF9mL-7wVs_kD37rGgo5Dge7AEXFTykJ2E0E1S-Kz0GDwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello. Is this package already available with Buildroot ? I sould like to
check it with one real device that I have.

Regards
SPc.


2013/10/14 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com>
> writes:
>
>  >> +
>  >> +comment "snmp++ requires a toolchain with threads and C++ support
> enabled"
>  >> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>
>  Thomas> This should now be:
>  Thomas> snmp++ needs a toolchain w/ threads, C++
>
> Ahh yes, sorry - Forgot, will fix.
>
>  Thomas> See: http://patchwork.ozlabs.org/patch/283094/
>  Thomas> (waiting to be merged, but discussed with Peter)
>
> I'll get to it in a moment.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Gracias | Regards

Saludos - Greetings - Freundliche Gr??e - Salutations
-- 
*Sergio Pedraja*

twitter: @sergio_pedraja
skype: Sergio Pedraja
http://plus.google.com/u/0/101292256663392735405
http://www.linkedin.com/in/sergiopedraja
http://www.quora.com/Sergio-Pedraja
http://spedraja.wordpress.com
https://www.xing.com/profile/Sergio_Pedraja <http://spedraja.wordpress.com/>
http://www.viadeo.com
http://www.avalonred.com/
-----
No crea todo lo que ve, ni crea que est? vi?ndolo todo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131021/a25c120e/attachment-0001.html>
