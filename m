From: Bruno N. <belgarath116@gmail.com>
Date: Thu, 31 May 2018 10:07:03 +0200
Subject: [Buildroot] [sources.buildroot.net] listing not available
In-Reply-To: <87po1d2l9i.fsf@dell.be.48ers.dk>
References: <CAL3OuNxjyRhG2c3-fBakZ7iSd+Vf+KqrKBdOSwzDrcNM_ajGqw@mail.gmail.com>
 <87po1d2l9i.fsf@dell.be.48ers.dk>
Message-ID: <CAL3OuNx_2RnrVJikft_iYbah_eGTgqYFJPsobqyOFnkfSD_eyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-05-30 17:52 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Bruno" == Bruno N <belgarath116@gmail.com> writes:
>
>  > Hello,
>  > I have make a copy of the repository http://sources.buildroot.net for
> an
>  > offline computer.
>  > Since some week i can't update my copy because the website don't list
>  > available packages.
>  > (I was using "wget --mirror" to make the copy)
>
>  > Is it possible to have the list of packages again ? (with something like
>  > the apache's mod_dir)
>
> Does it really make sense to make a copy of everything? This is
> currently > 160GB.


> > Or maybe are they an other way to make a copy of the repository ?
>
> If you just want to make sure you have downloaded everything needed to
> build a specific configuration then you can use 'make source'
>
> --
> Bye, Peter Korsgaard
>

I'm not the only user of this offline repository
This way :
 - Doing a 'make source' on the offline computer, put the list on USB key,
donwload need pakages on usb key, put packages on offline repository
look longer than :
 - Download everything on usb key and put it on offline repository

The second reason i download all the repository is, if another user build
with different package he dont need to ask me to download them from the
website and put it on the offline repository.
Downloading all the repository is not a very elegant way .... but i dont
have tool like 'apt-mirror' for buildroot.
Maybe there is a way to donwload all packages related to an buildroot
release?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180531/c829f3fe/attachment.html>
