From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:28:27 +0100
Subject: [Buildroot] [PATCH 1/3] package/boost: bump to version 1.59.0
In-Reply-To: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151213222827.027599c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 11 Dec 2015 14:57:57 +0100, J?rg Krause wrote:
> Also:
> * remove patch "gcc.jam compiler options fix" - merged upstream
> * renumber patch "fix uclibc eventfd".
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

I am not sure if it is related to the version bump or not, but boost is
causing some build issues:

   http://autobuild.buildroot.org/?reason=boost-1.59.0

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
