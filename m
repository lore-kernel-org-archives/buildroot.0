From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 22:50:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: Add new option
 for Qualcomm/Atheros 10k (QCA9377)
In-Reply-To: <20201111211720.GG3971474@scaer> (Yann E. MORIN's message of
 "Wed, 11 Nov 2020 22:17:20 +0100")
References: <20201111154637.61244-1-ju.o@free.fr>
 <20201111211720.GG3971474@scaer>
Message-ID: <87y2j7k1g5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Julien, All,
 > On 2020-11-11 16:46 +0100, Julien Olivain spake thusly:
 >> Initial Atheros ath10k QCA9377 support was introduced in Kernel v4.4
 >> [1]. More recently, in v5.7 [2], the SDIO support was also added. This
 >> patch adds a new option to install firmware files for this device.
 >> 
 >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a226b519d43a2a6b37267fea051aacb4a79c9614
 >> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6e51b0e4913ca2c93059f73ca477ca30ea95b6a0
 >> 
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>

 > Applied to master, thanks.

Why? Does this fix anything? It sounds like a new feature,
E.G. something for next to me?

-- 
Bye, Peter Korsgaard
