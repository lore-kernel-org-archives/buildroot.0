From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 11:29:40 +0200
Subject: [Buildroot] [PATCH v4 08/15] package/gcc: switch to gcc 8.x as
 the default
In-Reply-To: <20190622214410.4bc6022e@windsurf> (Thomas Petazzoni's message of
 "Sat, 22 Jun 2019 21:44:10 +0200")
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-9-giulio.benetti@micronovasrl.com>
 <20190622214410.4bc6022e@windsurf>
Message-ID: <8736k0fy4b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > What do we do with the older gcc versions ? We now have 4.9, 5, 6, 7, 8
 > and 9, which is quite a bit more than the normal number of 3 versions
 > we want to support.

 > Arnout: do you still think gcc 4.9 is needed at this point ? If it is
 > the case, should we keep gcc 4.9, but drop gcc 5 and 6 ?

I know it is painful for people stuck on E.G. old bootloader/kernel
versions, but I think it makes sense to slowly remove these old gcc
versions, so E.G. by the time we release 2020.02 that we only support
gcc 7/8/9.

-- 
Bye, Peter Korsgaard
