From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 22:21:48 +0100
Subject: [Buildroot] [PATCH] package/network-manager: Bump to version
 1.10.2
In-Reply-To: <20180122152938.23956-1-petr.vorel@gmail.com>
References: <20180122152938.23956-1-petr.vorel@gmail.com>
Message-ID: <20180129222148.76b68638@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Jan 2018 16:29:38 +0100, Petr Vorel wrote:
> + added new option support for OVS (adds new dependency to Jansson)

The OpenVSwitch support was added in 1.10.0, so it's not really related
to this bump. Could you do the bump in one patch, and the OVS addition
in another patch ?

Also, I believe OVS is not very clear. What about "OpenVSwitch support"
in the prompt and in the help text. The option could remained named
BR2_PACKAGE_NETWORK_MANAGER_OVS however, if you want.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
