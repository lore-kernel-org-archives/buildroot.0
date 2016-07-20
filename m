From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:28:08 +0200
Subject: [Buildroot] [PATCH v3,2/3] alljoyn-tcl: new package
In-Reply-To: <1467884015-27464-2-git-send-email-fabrice.fontaine@orange.com>
References: <1467884015-27464-1-git-send-email-fabrice.fontaine@orange.com>
 <1467884015-27464-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160720222808.7ee47ec4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 11:33:34 +0200, Fabrice Fontaine wrote:
> The AllJoyn framework defines a common way for devices and apps to
> communicate with one another regardless of brands, categories,
> transports, and OSes. Developers write applications that discover
> nearby devices, and communicate with each other directly and through
> the cloud, unleashing new possibilities in the Internet of Things.
> 
> AllJoyn Thin Core Library (AJTCL) is designed to bring the benefits
> of the AllJoyn distributed programming environment to embedded
> systems.
> 
> https://allseenalliance.org
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v2 -> v3 (after review of Romain Naour):
>  - Rename ajtcl into alljoyn-tcl for consistency
>  - Rewrap Config.in help text

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
