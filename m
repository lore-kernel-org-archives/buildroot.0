From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 19 Jun 2017 15:59:52 +0200
Subject: [Buildroot] [PATCH v2 0/1] fcgiwrap: Disable -Werror in CFLAGS set
	by configure.
In-Reply-To: <20170619133444.a6rx5nlqupwcsm6j@sapphire.tkos.co.il>
References: <20170619133444.a6rx5nlqupwcsm6j@sapphire.tkos.co.il>
Message-ID: <20170619135953.16205-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Please add a reference to the autobuild failure:
>
> http://autobuild.buildroot.net/results/8e0/8e04bf5a85ecd7f120bc9dedeedc891def6c46c1/

Done, thanks.  I also forgot to mention $(TARGET_CFLAGS) when
overriding the CFLAGS for configure, this should be fixed now.

Thomas Claveirole (1):
  fcgiwrap: Disable -Werror in CFLAGS set by configure.

 package/fcgiwrap/fcgiwrap.mk | 1 +
 1 file changed, 1 insertion(+)

-- 
2.11.0
