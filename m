From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 09:17:51 +0100
Subject: [Buildroot] [PATCH v6 01/28] package/qt5base: Do not build
 shared libs if BR2_STATIC_LIBS is chosen
In-Reply-To: <20200310091310.1c5bb22d@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-2-anaumann@ultratronik.de>
 <20200309222154.0eec932a@windsurf.home>
 <20200309234233.23d66662@gmx.net>
 <20200310091310.1c5bb22d@windsurf>
Message-ID: <20200310091751.55cf47bb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 10 Mar 2020 09:13:10 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 9 Mar 2020 23:42:33 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > That is funny, depends on !BR2_nios2 because of double conversion,
> > just fixed by 'package/qt5base: fix double-conversion compile for nios2' ([1]),
> > which was a autobuild failure..., but I think QT5 was enabled via
> > package/pinentry/Config.in without the '!BR2_arc && !BR2_nios2 && !BR2_xtensa'
> > dependency....
> >
> > Seems !BR2_nios2 can be dropped immediately from QT5 and !BR2_xtensa' after
> > back porting the second part from [2]...
>
> Indeed. Will you send some patches ?

Yes...

Regards,
Peter

>
> Thanks for spotting this!
>
> Thomas
