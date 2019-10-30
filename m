From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 21:49:12 +0100
Subject: [Buildroot] PACKAGE_IMX_GPU_VIV_G2D removed
In-Reply-To: <a3acab99-e1aa-bcf1-85dc-73f898ee1cd3@mectronicmedicale.it>
References: <a3acab99-e1aa-bcf1-85dc-73f898ee1cd3@mectronicmedicale.it>
Message-ID: <a2051f1f-8918-4a03-a2ee-ad905205bb86@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/10/2019 07:48, Andrea Previtali wrote:
> Hi all,
> 
> I'm running Buildroot 2018.02.12 and I noticed that PACKAGE_IMX_GPU_VIV_G2D has
> been removed.

 You should have gotten a big legacy warning at the end of the menu in 'make
menuconfig', and in help text of the old option explains what has happened:

"The G2D libraries are now provided by the imx-gpu-g2d package."


 Regards,
 Arnout

> 
> In the past I used 2017.11 and this package was included in the distro.
> 
> To realize our application we use Cranksoftware, which provides libraries
> package for imx6.
> 
> I'm not sure but I think Cranksoftware libraries need this package to run, I
> asked their support but the didn't give me an answer about this specific package.
> 
> During the Buildroot config I consulted the "help" related to this package, but
> did not found if it has been replaced by some other package.
> 
> 
> Can anyone help me please?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
