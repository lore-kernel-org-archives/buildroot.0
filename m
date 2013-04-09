From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Apr 2013 20:15:34 +0200
Subject: [Buildroot] Building Webkit 1.10.2 using buildroot hangs at
 "Installing to staging Directory"
In-Reply-To: <CAJsG2H5S=sm+a2f6m3d4W4A0EraQFu_5JR8J0CCZJ_zz_vKZrg@mail.gmail.com>
References: <CAJsG2H5S=sm+a2f6m3d4W4A0EraQFu_5JR8J0CCZJ_zz_vKZrg@mail.gmail.com>
Message-ID: <20130409201534.652f26f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bhupal Singh,

On Tue, 9 Apr 2013 18:02:31 +0530, Bhupal Singh wrote:

> I am in the procees of building webkit 1.10.2 using buildroot.
> I use --disable-jit as config option.
> Building goes fine till it reaches staging directory. Once it reaches
> "Installing to  staging Directory", it hangs.
> Please find the below logs

Can you please share the modifications you made to Buildroot, and the
Buildroot .config file you're using, so that we can reproduce the
problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
