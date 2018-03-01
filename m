From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Mar 2018 10:17:09 +0100
Subject: [Buildroot] [next,
 v2 4/8] cpe-info: infra defines CPE_ID_* defaults
In-Reply-To: <1519881819-51445-5-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519881819-51445-5-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180301101709.409c59eb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Feb 2018 23:23:35 -0600, Matt Weber wrote:
> Default to using the package name for the vendor
> and name as most CPE IDs seem to align with that
> assumption. Also use the pkg version as the CPE IDs
> initial version field.

Nits:

 - You're wrapping the lines too short. Funnily, the common mistake is
   to not wrap, or wrap too long. But here, you wrap too short. 72
   characters is the good length :)

 - Missing SoB.

> v2
> [Thomas P
>  - Created patch per suggestion to use infra
>    to cleanup common case in individual pkg
>    CPE_ID definition.

I'm surprised, because I thought the conclusion of our discussion was
that it was not desirable to have such default, because then we
couldn't make the difference between packages that have had their CPE
ID explicitly added/verified by someone, and packages that have their
CPE ID defined by default, and which may be incorrect.

Have you changed your mind about this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
