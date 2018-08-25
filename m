From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 23:52:14 +0200
Subject: [Buildroot] [PATCH v3 1/1] Python3: Bump to 3.7.0
In-Reply-To: <20180817184607.27639-1-aduskett@gmail.com>
References: <20180817184607.27639-1-aduskett@gmail.com>
Message-ID: <20180825235214.4fa77098@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Fri, 17 Aug 2018 11:46:07 -0700, Adam Duskett wrote:
> From: Adam Duskett <aduskett@greenlots.com>
> 
>   Other changes include:
> 
>   - Refreshing all necessary patches for 3.7.0

We have more Python 3.7.0 issues:

  python-lxml-4.0.0
  http://autobuild.buildroot.net/results/d8e/d8e3a9aae0e84fb1b3b8093986ec3a4ce7ca0663/build-end.log

  python-pyyaml-3.12
  http://autobuild.buildroot.net/results/e71/e715a7dc8b6856b4aba0b9b4568d61420c52a5c8/build-end.log

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
