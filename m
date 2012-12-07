From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Dec 2012 09:35:33 +0100
Subject: [Buildroot] Support of iMX6 hardware ?
In-Reply-To: <20121207091426.316173d6@skate>
References: <50C06206.6060905@wanadoo.fr> <20121206124855.796d4d38@skate>
 <50C198AD.8030703@wanadoo.fr> <20121207091426.316173d6@skate>
Message-ID: <CAHXCMML8DZ+f5euA__rE4v3bSzi2O0KqpZ4odGtoOm6sAo6f_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thierry, Thomas, all,

2012/12/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Thierry Bultel,
>
> On Fri, 07 Dec 2012 08:20:13 +0100, Thierry Bultel wrote:
>
>> As soon as I have something working, I will obviously submit
>> a patch for it.
>
> Great!
>
>> Thanks for the tip.
>> I have (at least) 2 packages to build.
>>
>> - The first one was the imx6-lib, that I have added under the Graphics
>> section, as a generic-package, and

Some people around Buildroot, like the Armadeus folks, have already
done part of the imx-lib integration.
It seems they presently support imx-lib for both imx27 and imx51.

You could certainly give a look at their work, might be usefull ;-):
http://armadeus.git.sourceforge.net/git/gitweb.cgi?p=armadeus/armadeus;a=blob;f=patches/buildroot/2012.11/174-imx-lib-add_package.patch;hb=HEAD


Regards,

-- 
Sam
