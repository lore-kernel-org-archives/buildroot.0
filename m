From: yann12 <douze.yann@gmail.com>
Date: Thu, 17 Dec 2015 07:19:46 -0800 (PST)
Subject: [Buildroot] Make error with Builroot
In-Reply-To: <20151217162514.751e3cc3@free-electrons.com>
References: <1450364297578-120495.post@n4.nabble.com>
 <20151217162514.751e3cc3@free-electrons.com>
Message-ID: <CACG_XU1kK1G6KeANOF1d-3eXwe=TyLL_3F9YcE=T0P2aJ_AgSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your help, here is the pastebin of the /home/novtech/Projects/me_
buildroot-2014.08/output/build/ncurses-5.9/config.log :

http://code.bulix.org/li2yfp-90040

Here the pastebin of the .config file :

http://code.bulix.org/z4n5jd-90041

All the best,
Yann



2015-12-17 16:07 GMT+01:00 Thomas Petazzoni-2 [via Buildroot (busybox)] <
ml-node+s2317881n120496h86@n4.nabble.com>:

> Yann,
>
> On Thu, 17 Dec 2015 06:58:17 -0800 (PST), yann12 wrote:
>
> > When I execute the make command, I have a strange error, I reproduce the
> log
> > here  :
> >
> > Configuring NCURSES 5.9 ABI 5 (Thu Dec 17 16:08:00 CET 2015)
> > checking build system type... x86_64-unknown-linux-gnu
> > checking host system type... arm-buildroot-linux-gnueabihf
> > checking target system type... arm-buildroot-linux-gnueabihf
> > Configuring for linux-gnueabihf
> > checking for prefix... /usr
> > checking for arm-buildroot-linux-gnueabihf-gcc...
> >
> /home/novtech/Projects/me_buildroot-2014.08/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc
>
> > checking for C compiler default output... configure: error: C compiler
> > cannot create executables
>
> Please pastebin somewhere (http://code.bulix.org) the contents of the
> file
> /home/novtech/Projects/me_buildroot-2014.08/output/build/ncurses-5.9/config.log.
>
>
> > It seems that he looks for arm-buildroot-linux-gnueabihf-gcc that
> doesn't
> > exist !
>
> It does exist, it is built by Buildroot at the beginning of the build.
>
> Also, please pastebin your complete .config file.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> [hidden email] <http:///user/SendEmail.jtp?type=node&node=120496&i=0>
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> ------------------------------
> If you reply to this email, your message will be added to the discussion
> below:
>
> http://buildroot-busybox.2317881.n4.nabble.com/Make-error-with-Builroot-tp120495p120496.html
> To unsubscribe from Make error with Builroot, click here
> <http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=120495&code=ZG91emUueWFubkBnbWFpbC5jb218MTIwNDk1fDk4NzU2MjQxMA==>
> .
> NAML
> <http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>
>



-- 
---------------------------------------------------------
Yann DOUZE
Mob : +33 6 61 11 48 89
---------------------------------------------------------




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Make-error-with-Builroot-tp120495p120497.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151217/4597c6e5/attachment.html>
