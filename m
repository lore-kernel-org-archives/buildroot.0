From: Ron Eggler <ron.eggler@gmail.com>
Date: Tue, 14 Feb 2017 09:29:35 -0800
Subject: [Buildroot] unrecognized command line option
In-Reply-To: <1842521354.10376219.1487085734283.JavaMail.zimbra@datacom.ind.br>
References: <CAHxBh_SM289CB32RrR8zOitn-LX0iVJLKcf0HpN1sV5JamV3+w@mail.gmail.com>
 <1842521354.10376219.1487085734283.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAHxBh_T5Z57brPqNPt551jFfpsXbnk_cQCSknwyV4vB-As_ZOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 14, 2017 at 7:22 AM, Carlos Santos <casantos@datacom.ind.br>
wrote:

> > From: "Ron Eggler" <ron.eggler@gmail.com>
> > To: buildroot at busybox.net
> > Sent: Tuesday, February 14, 2017 1:08:08 PM
> > Subject: [Buildroot] unrecognized command line option
>
> > Hi,
>
> > I'm trying to compile using buildroot with my own x toolchain (created
> for ppc
> > with crosstool-ng) but I get the following error on make:
>
> > powerpc-e500v2-linux-gnuspe-gcc: error: unrecognized command line
> option '
> > -march=i586 '
>
> You must choose the suitable target options (first item in the main menu
> when you run "make menuconfig") to match your target platform.
>

Hoops, yes, that's it! I've accidentally skipped that.
Thanks Carlos!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170214/567974ff/attachment.html>
