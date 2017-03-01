From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 09:05:03 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: fix build for toolchains without
 ssp
In-Reply-To: <AB6B30E9-21A6-499E-927B-401E5A94682A@gmail.com>
References: <1488320767-63856-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170228234037.12107729@free-electrons.com>
 <AB6B30E9-21A6-499E-927B-401E5A94682A@gmail.com>
Message-ID: <20170301090503.47ecd52e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list in CC, thanks!

On Wed, 1 Mar 2017 07:04:53 +0100, Fabrice Fontaine wrote:

> This is a separate build fix that applies to the version of cjson
> currently packaged in buildroot. I found this issue on 1.3.2 and was
> able to reproduce it on 1.3.0.

Ah, ok, it's probably new in 1.3.0, which we only have in the next
branch. Our master branch, and the 2017.02 release, only have 1.2.1,
which I guess doesn't have this issue since the autobuilders didn't
catch it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
