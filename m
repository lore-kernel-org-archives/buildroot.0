From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 22:32:42 +0100
Subject: [Buildroot] [PATCH 1/4] hostapd: select VLAN support
In-Reply-To: <20171223190617.3981-2-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
 <20171223190617.3981-2-alexander.i.mukhin@gmail.com>
Message-ID: <20171229223242.7b2e9115@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Dec 2017 22:06:14 +0300, Alexander Mukhin wrote:

> +ifneq ($(BR2_PACKAGE_HOSTAPD_VLAN),y)

This is better written as:

ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN),)

So I've fixed that, and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
