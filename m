From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 17 Dec 2019 09:57:43 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-12-16
In-Reply-To: <CAJ4jsadBGESKw4XvA5a5pXuX2duKEgE6ZtBBjPo-MH_RnH-fLQ@mail.gmail.com>
References: <5df88115.1c69fb81.d3f43.681eSMTPIN_ADDED_MISSING@mx.google.com>
 <CAJ4jsadBGESKw4XvA5a5pXuX2duKEgE6ZtBBjPo-MH_RnH-fLQ@mail.gmail.com>
Message-ID: <CAJ4jsaeAwns3NC6wAONHMXHvQaR6Fk2Z=PqkX04apuWJ0V0Qng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 17, 2019 at 9:44 AM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Tue, Dec 17, 2019 at 4:17 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Recent build failures and runtime-tests failures
> > ================================================
> >
> > This is the list of Buildroot build failures that occurred on
> > 2019-12-16, and for which you are a registered architecture developer,
> > package developer or defconfig developer. This list also include
> > runtime tests failures. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Results for the 'master' branch
> > -------------------------------
> >
> > Build failures related to your packages:
> >
> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >     arm      |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
> >     arm      |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
> > microblazeel |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
> > microblazeel |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
> > microblazeel |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
> >     arm      |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
> > microblazeel |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
> >     arm      |         tpm2-tss-2.3.2         | http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
> >
> >
> >
> > --
> > http://autobuild.buildroot.net
>
> This is because of a test that needs C++. I'm testing a patch to
> circumvent the problem while ask for definitive solution from
> upstream.

It has been reported before:
https://github.com/tpm2-software/tpm2-tss/issues/1508

-- 
Carlos Santos <unixmania@gmail.com>
