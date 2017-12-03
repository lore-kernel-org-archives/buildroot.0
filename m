From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 21:00:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 60.1
In-Reply-To: <20171203194140.8138-1-bernd.kuhls@t-online.de>
References: <20171203194140.8138-1-bernd.kuhls@t-online.de>
Message-ID: <20171203210012.0cb2bc4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 20:41:40 +0100, Bernd Kuhls wrote:
> Removed 0006-i18n-Drop-include-xlocale.h.patch, problem was fixed
> upstream with a different solution:
> http://bugs.icu-project.org/trac/changeset/40603
> 
> Added upstream sha512 hash and license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Curious: how many packages that depend on ICU did you build? From past
experience, each major ICU bump very often causes a number of build
failures in other packages.

What are the changes between 59.1 and 60.1 ? Anything significant that
has a chance of breaking packages that depend on ICU ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
