From: Steven Woody <narkewoody@gmail.com>
Date: Thu, 18 Oct 2007 09:50:51 +0800
Subject: [Buildroot] an error in make ( no .config under kernel
	directory )
In-Reply-To: <20071018013332.GA724@cloud.net.au>
References: <ed4892840710171811k6210e59cn2bb089a8ec21c297@mail.gmail.com>
	<20071018013332.GA724@cloud.net.au>
Message-ID: <ed4892840710171850m506790fbga9e96c0a79250900@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/18/07, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Thu, Oct 18, 2007 at 09:11:00AM +0800, Steven Woody wrote:
> > the buildroot is the subversion version in Oct 14.
> >
> > when doing make, i got
> >
> > ...
> > cp -dpRf package/config/buildroot-config
> > /home/src/buildroot/project_build_arm/M501/buildroot-config
> > cp -dpf  /home/src/buildroot/project_build_arm/M501/linux-2.6.22.10/.config
> > ...
> >
> > and, i go to dl/M501/linux-2.6.22.10 directory and found no .config
> > file.  what's wrong here?  the linux-2.6.10 kernel was downloaded in
> > another computer and was put in dl directory.
>
> You have to specify the filename for your configuration file in "make
> menuconfig" -> kernel.
>

understood.  but where can i got a configureation file for the
2.6.22.10?  havn't buildroot supplied a default one suitable to
embedded target for me?

thanks.
