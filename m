From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 30 Jan 2013 11:01:26 +0100 (CET)
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <5108EDDC.5050808@mind.be>
Message-ID: <f05257cb-b9a4-405c-8e3d-90a0bb017206@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>   But the problem is that the buildroot configuration conflicts with
>   the
> kernel configuration.
> 
> 
>   Regards,
>   Arnout
> 


aha....

so our problem is that make linux-menuconfig should change the buildroot configuration option from "use defconfig" to "use a custom configuration"

is that it ?
