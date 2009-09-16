From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 16 Sep 2009 19:21:54 -0300
Subject: [Buildroot] [PATCH 2/6] Remove the BOARD/LOCAL feature
In-Reply-To: <20090917000846.2eb5baca@surf>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<d6cda7730909161500xbb81de5j195ce89fd2fd5db2@mail.gmail.com>
	<20090917000846.2eb5baca@surf>
Message-ID: <d6cda7730909161521k54dbdcfaud53cca89589dffe6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Wed, Sep 16, 2009 at 7:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> export BUILDROOT_EXTERNAL_BOARDS=/some/directory
> make menuconfig
> ?# you see your external boards directly in the configuration
> make

Exporting a variable all the time is a bit anoying, but one could
always create a script to do that.

> And that's it.
>
> What do you think ?

Looks good. It would be nice to add BUILDROOT_EXTERNAL_BOARDS to the
find command at the %_defconfig rule, so things like this would work:
make mycustomboard_defconfig

Kind Regards,
    Thiago A. Correa
