From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 23 Nov 2018 11:10:25 +0100
Subject: [Buildroot] [PATCH 5/5] optee-test: new package
In-Reply-To: <790904575.3322760.1542942409059.JavaMail.zimbra@datacom.com.br>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
 <1542900177-17343-5-git-send-email-etienne.carriere@linaro.org>
 <790904575.3322760.1542942409059.JavaMail.zimbra@datacom.com.br>
Message-ID: <CAN5uoS-qCZcCKTrZqwrb0xTeXUmk3OEaZzWazKWswz=R5psQ3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Nov 2018 at 04:06, Carlos Santos <casantos@datacom.com.br> wrote:
>
> > From: "Etienne Carriere" <etienne.carriere@linaro.org>
> > To: "buildroot" <buildroot@buildroot.org>
> > Cc: "etienne carriere" <etienne.carriere@linaro.org>
> > Sent: Quinta-feira, 22 de novembro de 2018 13:22:57
> > Subject: [Buildroot] [PATCH 5/5] optee-test: new package
>
> [...]
> > --- /dev/null
> > +++ b/package/optee-test/Config.in
> > @@ -0,0 +1,64 @@
> > +config BR2_PACKAGE_OPTEE_TEST
> > +     bool "optee_test"
> > +     depends on BR2_aarch64 || BR2_arm
> > +     help
> > +       This build option enables OP-TEE test package from the
> > +       OP-TEE project. It helps platforms to verify the OP-TEE
> > +       installation against a set of regression and performance
> > +       tests.
> > +
> > +       The package generates userspace test applications and
> > +       data files for the Linux userland. It also generates
> > +       OP-TEE trusted applications embedded in the target
> > +       directory /lib/optee-armtz. These are loaded into the
> > +       secure world at runtime.
> > +
> > +       http://github.org/OP-TEE/optee_test
>
> Must be https://github.com/OP-TEE/optee_test

Hello Carlos,

Yes, thanks.

regards,
etienne

>
> --
> Carlos Santos (Casantos) - DATACOM, P&D
> ?Marched towards the enemy, spear upright, armed with the certainty
> that only the ignorant can have.? ? Epitaph of a volunteer
