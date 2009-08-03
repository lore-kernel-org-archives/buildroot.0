From: Lars Lockenvitz <l.lockenvitz@fpga-art.de>
Date: Mon, 03 Aug 2009 14:50:36 +0200
Subject: [Buildroot] Building Linux system - Beginner
In-Reply-To: <BAY136-W12FA46770D513040299E68CE0F0@phx.gbl>
References: <BAY136-W12FA46770D513040299E68CE0F0@phx.gbl>
Message-ID: <4A76DD1C.7090200@fpga-art.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

normally all your downloads are in dl directory.
And you can configure your kernel with "make linux26-menuconfig"

Try a "make help" and you see witch other options you have with make!

Regards

Raed Abu-Sanad schrieb:
> Hi,,
>
> I read the documentation of buildroot. and i manged to configure and 
> build the filesystem using "make menuconfig" and "make" after 
> extracting the downloaded file. I noticed in the begginning it was 
> downloading the kernel 2.6.30..
> My wquestion is: where it has been downloaded and how can i 
> configure/compile the kernel? or it is already done?
>
> Thanks
>
> ------------------------------------------------------------------------
> Internet Explorer 8 - accelerate your Hotmail. Download Internet 
> Explorer 8 <http://clk.atdmt.com/UKM/go/134665338/direct/01/>
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
