From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 11 Feb 2013 16:30:00 +0100
Subject: [Buildroot] [PATCH] New host package: sunxi-tools
In-Reply-To: <511267E7.6080603@je-eigen-domein.nl>
References: <1360158308-16233-1-git-send-email-bos@je-eigen-domein.nl>
 <20130206145604.7ae023bd@skate> <511267E7.6080603@je-eigen-domein.nl>
Message-ID: <51190E78.50405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 06/02/2013 15:25, Floris Bos a ?crit :
> On 02/06/2013 02:56 PM, Thomas Petazzoni wrote:
>> I think it should be noted somewhere that those tools are needed for
>> the non-mainline Linux kernel for Allwinner SoCs, which has chosen to
>> use completely non-standard mechanisms for board definition files and
>> pinmuxing description.
> 
> The description already mentions it is for the linux-sunxi kernel.
> Could add the word "non-mainline" though, to avoid confusion.

Well, linux-sunxi isn't very explicit for someone that is not very used
to the Allwinner platform. There's no way he'll get that it means "the
fork of allwinner's linux source code maintained on github by a separate
community".

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
