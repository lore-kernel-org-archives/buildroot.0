From: Bhupal Singh <singhbhupal88@gmail.com>
Date: Wed, 10 Apr 2013 14:13:01 +0530
Subject: [Buildroot] Building Webkit 1.10.2 using buildroot hangs at
 "Installing to staging Directory"
In-Reply-To: <20130409201534.652f26f1@skate>
References: <CAJsG2H5S=sm+a2f6m3d4W4A0EraQFu_5JR8J0CCZJ_zz_vKZrg@mail.gmail.com>
 <20130409201534.652f26f1@skate>
Message-ID: <CAJsG2H6+dJYSjL182RenpR4cArP_kuKj-QoOCBj+gZ8fzkX=2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks for immediate reply.
I am not in the position to share the buildroot.config file.
I have attached webkit.mk file from package folder.

Regards,
Bhupal Singh Chauhan

On Tue, Apr 9, 2013 at 11:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Bhupal Singh,
>
> On Tue, 9 Apr 2013 18:02:31 +0530, Bhupal Singh wrote:
>
> > I am in the procees of building webkit 1.10.2 using buildroot.
> > I use --disable-jit as config option.
> > Building goes fine till it reaches staging directory. Once it reaches
> > "Installing to  staging Directory", it hangs.
> > Please find the below logs
>
> Can you please share the modifications you made to Buildroot, and the
> Buildroot .config file you're using, so that we can reproduce the
> problem?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
Warm Regards,
BS_Chauhan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130410/612ddee3/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: webkit.mk
Type: application/octet-stream
Size: 1008 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130410/612ddee3/attachment-0001.obj>
