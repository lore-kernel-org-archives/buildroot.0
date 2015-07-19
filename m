From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 10:11:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: disable for PowerPC
 CS toolchains
In-Reply-To: <1437289664.12715.17.camel@embedded.rocks>
References: <1437086706-20437-1-git-send-email-joerg.krause@embedded.rocks>
 <20150718111610.55f5a57b@free-electrons.com>
 <1437289664.12715.17.camel@embedded.rocks>
Message-ID: <20150719101144.3b8e071f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Jul 2015 09:07:44 +0200, J?rg Krause wrote:

> Upstream submitted a patch regarding this build error which removes the
> necessity for a gcc >= 4.6 toolchain. Shall I submit this upstream
> patch to allow using the excluded toolchains again, or do we just wait
> until a new version of upmpdcli will be released and we include them
> again in that case?

I think you can wait for the new upstream release, and at this point
remove the toolchain exclusions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
