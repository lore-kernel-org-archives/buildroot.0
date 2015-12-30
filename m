From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 16:00:16 +0100
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
Message-ID: <20151230160016.14524b1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Wed, 30 Dec 2015 16:06:05 +0200, Alex Suykov wrote:
> The package uses git to download the sources.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

I think it is good to have hash files in this case, even if they simply
indicate "there's no hash". This way, we will be able in the future to
make hash files mandatory.

I *think* this was part of the conclusion we had at the latest
Buildroot Developers Meeting, even if the write up at
http://elinux.org/Buildroot:DeveloperDaysELCE2015 doesn't make this
completely clear.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
