From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 3 Sep 2018 10:29:46 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-08-30
In-Reply-To: <241764101.4041403.1535918222698.JavaMail.zimbra@datacom.com.br>
References: <20180831060016.342FF22A3A@mail.bootlin.com>
 <241764101.4041403.1535918222698.JavaMail.zimbra@datacom.com.br>
Message-ID: <CANQCQpZxci70YBUJAfJ12RTjDtPBeD8M-3H4b_6EVMUe+oB9jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Sun, Sep 2, 2018 at 2:56 PM Carlos Santos <casantos@datacom.com.br> wrote:
>
> > From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> > To: "DATACOM" <casantos@datacom.com.br>
> > Sent: Friday, August 31, 2018 3:00:16 AM
> > Subject: [autobuild.buildroot.net] Your build results for 2018-08-30
>
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2018-08-30, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Results for the 'next' branch
> > =============================
> >
> > Build failures related to your packages:
> >
> >         arm |              util-linux-2.32.1 |
> >         http://autobuild.buildroot.net/results/c8e34d661098e96e3f627d7c022fdcf3efa40805
> >
> > --
> > http://autobuild.buildroot.net
>
> I'm still unable to reproduce these "SELinux selected but libselinux
> not found or too old" errors.

I haven't dug to much, was there a bump of util-linux in "next"?
Maybe if it's using pkgconfig for that test, the latest libselinux
bump isn't updating its pkgconfig entry or the version its at is not
compatible now?

Could be the test is checking the local system too....  I'll see if I
can reproduce but all my machines have selinux.

Matt
