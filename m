From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 09:16:39 +0100
Subject: [Buildroot] compat-wireless into build root
In-Reply-To: <1362630072.60039.YahooMailNeo@web162906.mail.bf1.yahoo.com>
References: <1362630072.60039.YahooMailNeo@web162906.mail.bf1.yahoo.com>
Message-ID: <20130307091639.67fbc5d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sridhar Addagada,

On Wed, 6 Mar 2013 20:21:12 -0800 (PST), Sridhar Addagada wrote:

> Did anyone compile compt-wireless kernel modules within the buildroot
> framework? I tried to look through the archives did not find any
> patch, OpenWRT is doing it, so i thought may be buildroot has it
> integrated.

No, I don't think anyone integrated the compat-wireless kernel modules
into Buildroot. OpenWRT has forked Buildroot many, many years ago, and
it has diverged very significantly from Buildroot, so we clearly don't
have the same set of packages.

Feel free to package compat-wireless and submit a patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
