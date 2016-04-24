From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:21:52 +0200
Subject: [Buildroot] [PATCH v6 0/5] Support building barebox with an
 auxiliary config
In-Reply-To: <cover.1461531859.git.pieter@boesman.nl>
References: <cover.1461531859.git.pieter@boesman.nl>
Message-ID: <20160424232152.5e757542@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 23:15:22 +0200, Pieter Smith wrote:

> Revision history:
> v6: Review rework based on feedback from Thomas Pettazoni:
>     - Second config build renamed to auxiliary build.
>     - Primary package build moved to boot/barebox/barebox to keep things symmetric.
>     - Dropped already merged parts of series.

Thanks for this new version, looks good to me! I'll wait for Arnout to
comment and see if he has objections to this way of doing things.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
