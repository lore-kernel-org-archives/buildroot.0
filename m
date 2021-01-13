From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Jan 2021 22:37:42 +0100
Subject: [Buildroot] Support for NXP QorIQ Layerscape based boards?
In-Reply-To: <1610518928213-0.post@n4.nabble.com>
References: <1610518928213-0.post@n4.nabble.com>
Message-ID: <8498bdd6-1408-1d01-720e-ca01241651a8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2021 07:22, scdrj wrote:
> I am unable to find the config files for the NXP QorIQ Layerscape based
> boards.
> 

 I believe p1010, p1025 and t1040 are Layerscape CPUs. And there's a patch [1]
to add ls1028 as well.

> These are already available in the OpenIL project
> (https://github.com/openil/openil).

 Feel free to upstream those patches :-)

 Regards,
 Arnout

[1]
http://patchwork.ozlabs.org/project/buildroot/patch/20200207083857.28058-9-jerry.huang at nxp.com/

> 
> Is there any plan to integrate the support for NXP QorIQ Layerscape boards
> in the original buildroot?
> 
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
