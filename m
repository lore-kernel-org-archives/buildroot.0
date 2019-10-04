From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Oct 2019 14:43:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: fix rpcbind path
In-Reply-To: <20191004102011.49146e17@windsurf>
References: <20191003144504.47060-1-james.hilliard1@gmail.com>
 <20191004102011.49146e17@windsurf>
Message-ID: <CADvTj4quF8k3ZZ7zxjsVNm=nVe9YsiS5V2C-NJz4+KeVBPqz-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 4, 2019 at 10:20 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu,  3 Oct 2019 08:45:04 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Per upstream commit 9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0
> > https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0
> >
> > The rpcbind binary was moved from bin to sbin.
> >
> > As such we must update the path in our service/init files.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> $ git tag --contains 9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0 | cat
> pcbind-0_2_5-rc4
> rpcbind-0_2_5-rc3
> rpcbind-1_2_5
>
> Buildroot 2019.08.x has rpcbind 0.2.3, so the issue is only relevant on
> master. Correct ?
Yes, that's correct.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
