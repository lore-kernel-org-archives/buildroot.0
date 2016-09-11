From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:08:00 +0200
Subject: [Buildroot] [PATCH] package/upmpdcli: bump to version 1.2.2
In-Reply-To: <20160911072139.3781-1-joerg.krause@embedded.rocks>
References: <20160911072139.3781-1-joerg.krause@embedded.rocks>
Message-ID: <20160911230800.2cb11300@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 09:21:39 +0200, J?rg Krause wrote:
> Upstream did not provide a hash file, so calculate the hash was calculated
> manually.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This update causes a number of build issues. Could you have a look at:

  http://autobuild.buildroot.net/?reason=upmpdcli-1.2.2

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
