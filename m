From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 14:04:04 +0100
Subject: [Buildroot] [PATCH] strongswan: bump to version 5.2.1
In-Reply-To: <549801E5.7020104@zacarias.com.ar>
References: <1418691367-12528-1-git-send-email-gustavo@zacarias.com.ar>
 <20141220214814.2f2f0521@free-electrons.com>
 <549801E5.7020104@zacarias.com.ar>
Message-ID: <20141222140404.26d7dfcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Dec 2014 08:35:01 -0300, Gustavo Zacarias wrote:

> Possibly, however it won't do any good since some tools (openac) are
> just gone upstream and i've defaulted to 'y' for the new split tool options.

Ok. But still, even if some tools are gone upstream, we should have
some Config.in.legacy handling, no?

> Frankly speaking i'd rather see the number of options reduced for this
> package, only a few of them introduce dependencies:
> Curl fetcher (libcurl)
> TNCCS 1.1 (libxml2)
> EAP-SIM (pcsc-lite)
> 
> And that's it, the other options won't make strongswan that big.

No problem on my side, feel free to submit some patches :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
