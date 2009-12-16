From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 16 Dec 2009 14:50:26 +0100
Subject: [Buildroot] avahi dependencies on host tools
In-Reply-To: <20091216102451.339e6ba9@surf>
References: <20091216102451.339e6ba9@surf>
Message-ID: <5f2b60912160550x6d3ae47eu4f625f0259737e95@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/16 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hi,
>
> I tried to build the avahi package on a freshly installed Ubuntu system
> (which has almost zero development related packages installed), and the
> build failed because it couldn't find "intltool" on the host.
>
> Should we build this tool ourself, or should we rely on the user to
> install it ?
>
> This tool itself relies on Perl. Can we assume that host Perl is a
> mandatory dependency of Buildroot, or should we also build Perl ?

IMHO, I'd like for Buildroot to build the least amount of host tools so that
build times can be kept down. I often start from scratch... :-)

Best regards,
Bj?rn Forsman
