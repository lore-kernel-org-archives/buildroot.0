From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:20:38 +0100
Subject: [Buildroot] [PATCH v2] ACS CCID PC/SC Driver added.
In-Reply-To: <1451488583-1546-1-git-send-email-juha@codercoded.com>
References: <1451475203-23925-2-git-send-email-juha@codercoded.com>
 <1451488583-1546-1-git-send-email-juha@codercoded.com>
Message-ID: <20151230232038.2f542e1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Juha,

On Wed, 30 Dec 2015 17:16:23 +0200, Juha Rantanen wrote:
> Fixes for acsccid.
> 
> Signed-off-by: Juha Rantanen <juha@codercoded.com>
> ---
> Changes v1 -> v2:
>   - syntax fixes
>   - removed flex and perl deps
>   - libusb optional
>   - added license

I've applied after doing the following changes:

    [Thomas:
     - fix commit title
     - change libusb back to a mandatory dependency, since even though
       there is a --disable-libusb option, it has no effect, and the code
       fails to build due to missing libusb.h
     - add hash file, noticed by Arnout
     - remove host-perl dependency, noticed by Arnout
     - rewrap Config.in help text, noticed by Arnout.]

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
