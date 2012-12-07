From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Dec 2012 09:55:41 +0100
Subject: [Buildroot] Support of iMX6 hardware ?
In-Reply-To: <20121207093816.3722030d@skate>
References: <50C06206.6060905@wanadoo.fr> <20121206124855.796d4d38@skate>
 <50C198AD.8030703@wanadoo.fr> <20121207091426.316173d6@skate>
 <CAHXCMML8DZ+f5euA__rE4v3bSzi2O0KqpZ4odGtoOm6sAo6f_w@mail.gmail.com>
 <20121207093816.3722030d@skate>
Message-ID: <CAHXCMMJOCtRun6xCjX_sZfQcZxWZLMyVVBnrbzUY1oAhXU7HDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2012/12/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Fri, 7 Dec 2012 09:35:33 +0100, Samuel Martin wrote:
>
>> Some people around Buildroot, like the Armadeus folks, have already
>> done part of the imx-lib integration.
>> It seems they presently support imx-lib for both imx27 and imx51.
>>
>> You could certainly give a look at their work, might be usefull ;-):
>> http://armadeus.git.sourceforge.net/git/gitweb.cgi?p=armadeus/armadeus;a=blob;f=patches/buildroot/2012.11/174-imx-lib-add_package.patch;hb=HEAD
>
> Any idea why they don't submit their work upstream?
>
> They have a huge number of patches for Buildroot in
> http://armadeus.git.sourceforge.net/git/gitweb.cgi?p=armadeus/armadeus;a=tree;f=patches/buildroot/2012.11;hb=HEAD
> and they don't submit anything. It's sad.

They are working on it, see:
http://www.armadeus.com/wiki/index.php?title=Buildroot_Mainline_integration

And here, the WIP branch of what I've already done, and I plan to post shortly:
https://github.com/tSed/buildroot/commits/sma/armadeus-integration


It's just a slow process, not necessarly time-to-market-friendly at
first look! ;-)


Regards,

-- 
Sam
