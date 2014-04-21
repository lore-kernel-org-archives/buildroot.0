From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 21 Apr 2014 19:35:50 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <20140420104812.5bc926a9@skate>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
 <20140420104812.5bc926a9@skate>
Message-ID: <535556F6.3050807@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
...
>>         arm |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/5a7fd0de2747e876a182117d7f7d8f16b20cadea/
>
> checking for init_snmp in -lnetsnmp... no
> configure: error: SNMP sanity check failed. Please check config.log for more information.
> make: *** [/home/test/test/3/output/build/php-5.5.11/.stamp_configured] Error 1
>
> Gustavo, Luca?
>

My bad, it built perfectly here! Tried uninstalling net-snmp from my
host, as well as installing it with -dev packages. It always built fine.

FWIW, my build machine is a 64-bit Ubuntu 13.10.

Can you share the output/build/php-5.5.11/config.log file from your
build server please?

-- 
Luca
