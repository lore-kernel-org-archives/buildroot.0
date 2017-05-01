From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 09:21:42 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: fix build of gatttool
In-Reply-To: <813b44550d7406827f9307514a8386b4462b854d.1493620107.git.baruch@tkos.co.il>
References: <813b44550d7406827f9307514a8386b4462b854d.1493620107.git.baruch@tkos.co.il>
Message-ID: <20170501092142.216bc5b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 09:28:27 +0300, Baruch Siach wrote:
> Since BlueZ 5.44 gatttool is hidden behind the --enable-deprecated configure
> option.
> 
> Also, update the help text with the new status of gatttool.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ddb/ddb975c9e1475fee1da63cb21240d8d59b161076/
> http://autobuild.buildroot.net/results/19a/19adc0aa5a7e48119ef4ba25ba0403867f74f678/
> http://autobuild.buildroot.net/results/9bd/9bd8e13ddffdd0631ddca30ec40cc4664729b0cb/
> 
> Cc: Marcin Bis <marcin@bis.org.pl>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

We have lots of patches pending on bluez5_utils, to solve this issue
and others. It's not clear what is the overall plan, as all the patches
have been sent separately (i.e not in a series).

See
https://patchwork.ozlabs.org/project/buildroot/list/?submitter=&state=&q=bluez&archive=&delegate=.

Essentially, your patch is the third one to solve the gattool problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
