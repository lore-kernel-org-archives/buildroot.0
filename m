From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 15:01:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/leveldb: bump version to 1.22
References: <20191006122828.23586-1-bernd.kuhls@t-online.de>
 <20191007222626.7180e191@windsurf>
Message-ID: <edv87gx8vh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Mon, 07 Oct 2019 22:26:26 +0200 schrieb Thomas Petazzoni:

> Indeed, I remember that libmemenv.a and memenv.h were explicitly
> installed here because they were needed by qt5webkit, and I tested the
> new 1.22 version of leveldb with its CMake based build system, and it
> doesn't install those files.

sent v2: http://patchwork.ozlabs.org/patch/1175711/

> Also, could you verify that minetest still builds fine with this version
> of leveldb ?

Yes, minetest still builds.

Regards, Bernd
