From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 03 Jan 2014 07:24:28 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-02
In-Reply-To: <20140103085800.GO6589@tarshish>
References: <20140103073007.E79CA101DFF@stock.ovh.net>
 <20140103074504.GN6589@tarshish> <2683108.9dlVqoAHeN@sagittae>
 <20140103085800.GO6589@tarshish>
Message-ID: <52C68FDC.6090908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/2014 05:58 AM, Baruch Siach wrote:

> Thanks. But in my case libstdc++.a does get built. It just not copied to 
> staging. Do you thing your patch is still relevant?

The failure to copy libstdc++.a is causing a few build failures for
static scenarios.
Probably need to tweak package/gcc/gcc-final/gcc-final.mk at the
HOST_GCC_FINAL_INSTALL_USR_LIBS definition.
Regards.
