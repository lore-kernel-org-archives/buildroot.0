From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2020 15:13:40 +0200
Subject: [Buildroot] [PATCH 5/5] package/gcc: switch to gcc 9.x as the
 default
In-Reply-To: <20200624215654.1ccffabd@windsurf> (Thomas Petazzoni's message of
 "Wed, 24 Jun 2020 21:56:54 +0200")
References: <20200608221347.2639059-1-romain.naour@gmail.com>
 <20200608221347.2639059-5-romain.naour@gmail.com>
 <20200624215654.1ccffabd@windsurf>
Message-ID: <87imez4ge3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue,  9 Jun 2020 00:13:47 +0200
 > Romain Naour <romain.naour@gmail.com> wrote:

 >> Even if gcc 8 is still maintained for some time (gcc 8.5 is pending),
 >> switch to gcc 9.x since it has been released since 2019-05-03 and
 >> gcc 10.x is available since 2020-05-07.
 >> 
 >> We have been having toolchains in the autobuilders with gcc
 >> 9.x for a while, so the vast majority of the problems should have
 >> already been solved.
 >> 
 >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
 >> ---
 >> package/gcc/Config.in.host | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks.

 > Following this, we should drop gcc 7.x support. However, one defconfig
 > (roseapplepi) still uses gcc 7.x. I've notified Peter Korsgaard on IRC,
 > and I am doing it here as well: if this defconfig is not updated to a
 > newer kernel that builds with gcc >= 8.x, we will have to drop support
 > for this defconfig.

I'll take a look at updating it next weekend, otherwise we can just drop
it.

-- 
Bye, Peter Korsgaard
