From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Mar 2017 17:40:34 +0200
Subject: [Buildroot] How to run stysctl at system startup?
In-Reply-To: <1018995825.16946984.1490887922628.JavaMail.zimbra@datacom.ind.br>
References: <1018995825.16946984.1490887922628.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170330174034.1aa50eab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Mar 2017 12:32:02 -0300 (BRT), Carlos Santos wrote:

> The procps-ng package does not install a script at /etc/init.d to run
> 
>     sysctl --system
> 
> Is this purposeful? I can circumvent the problem by means of an init scrip
> in my $(BR2_ROOTFS_OVERLAY)/etc/init.d/ but it would be nice to have that
> script provided by default.

FWIW, Busybox also provides a sysctl utility, which is enabled in our
default Busybox configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
