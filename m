From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 00:23:31 +0200
Subject: [Buildroot] [PATCH 2/2] audacious-plugins: new package
In-Reply-To: <1466590084-21798-2-git-send-email-gustavo@zacarias.com.ar>
References: <1466590084-21798-1-git-send-email-gustavo@zacarias.com.ar>
 <1466590084-21798-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160702002331.35695d91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 07:08:04 -0300, Gustavo Zacarias wrote:

> +AUDACIOUS_PLUGINS_LICENSE = BSD-2c

Unfortunately, the reality is much, much more complicated. The COPYING
file says:

"""
The build system and framework for installing and managing plugins is:

[.... here the BSD-2c license text ....]

The plugins themselves are distributed under their own distribution
terms. Read the source code for individual copyright holders and
licensing details.
"""

And indeed, each plugin has its own license.

How should we handle that? Enumerate the licenses of all plugins?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
