From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 12:03:11 +0100
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.29
In-Reply-To: <061cbb4c-8b53-4f32-9d03-344b1ff0c009@zacarias.com.ar>
References: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
 <4ebba581b256855a7e36993f044ef2b6a6cdfd72.1489136084.git.baruch@tkos.co.il>
 <061cbb4c-8b53-4f32-9d03-344b1ff0c009@zacarias.com.ar>
Message-ID: <20170310120311.2517d6d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 06:56:00 -0300, Gustavo Zacarias wrote:

> Did you try with older headers?
> Beacuse last time i tried 3.2.{28,29} weren't happy at least with 3.2.x 
> hence i refrained from bumping and carrying that dependency along a few 
> packages.

Thanks for this report. To avoid such bumps, it would be nice when you
realize a bump shouldn't be done for reason X, Y or Z, to send a patch
that adds a comment above the <pkg>_VERSION variable that indicates why
it shouldn't be bumped, or at least what the person doing the bump
should take care of :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
