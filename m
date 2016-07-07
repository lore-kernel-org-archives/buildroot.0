From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 09:20:15 +0200
Subject: [Buildroot] [PATCH v2,1/4] alljoyn: new package
In-Reply-To: <1467806931-9880-1-git-send-email-fabrice.fontaine@orange.com>
References: <1467806931-9880-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160707092015.22c1a903@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks for a lot for having reposted the complete set of
packages as a single series. It makes a lot easier to see that they are
related, and in which order.

On Wed,  6 Jul 2016 14:08:48 +0200, Fabrice Fontaine wrote:
> The AllJoyn framework defines a common way for devices and apps to
> communicate with one another regardless of brands, categories,
> transports, and OSes. Developers write applications that discover
> nearby devices, and communicate with each other directly and through
> the cloud, unleashing new possibilities in the Internet of Things.
> 
> https://allseenalliance.org
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

I've applied your patch to master, with some minor tweaks:

    [Thomas:
     - rewrap Config.in help text
     - remove / at the beginning of the ALLJOYN_DISTDIR variable.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
