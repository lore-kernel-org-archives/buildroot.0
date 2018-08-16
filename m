From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:05:38 +0200
Subject: [Buildroot] [PATCH/next v3 1/1] package/qt5/qt5base: fix statx
 support with glibc >= 2.28
In-Reply-To: <lrug4fxqji.ln2@ID-313208.user.individual.net>
References: <20180813194206.24355-1-bernd.kuhls@t-online.de>
 <20180814154127.1a60cab7@windsurf>
 <lrug4fxqji.ln2@ID-313208.user.individual.net>
Message-ID: <20180816220538.28886c63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 21:11:17 +0200, Bernd Kuhls wrote:

> because the qt5 dependency of vlc was my first ever contact with qt5 in 
> buildroot I did not notice that 5.6 can also be selected while 5.11 is 
> the default version. I think qt 5.6 does not need any patches for 
> glibc-2.28 because I just did a successful build with the current next 
> branch:

OK, thanks for verifying this!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
