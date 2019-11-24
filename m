From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:49:00 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libkcapi: bump version to
 1.1.5
In-Reply-To: <20191027142533.5e232a21@windsurf.dhcp.lyon.intranet> (Thomas
 Petazzoni's message of "Sun, 27 Oct 2019 14:25:33 +0100")
References: <20190831115005.19866-1-bernd.kuhls@t-online.de>
 <20191027142533.5e232a21@windsurf.dhcp.lyon.intranet>
Message-ID: <871rtxuer7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 31 Aug 2019 13:50:05 +0200
 > Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

 >> Removed patch applied upstream:
 >> https://github.com/smuellerDD/libkcapi/commit/52620ec798a580b2053d16a42362e9926729eb30
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> ...pi-hasher.c-fix-build-with-gcc-8.2.x.patch | 54 -------------------
 >> package/libkcapi/libkcapi.hash                |  2 +-
 >> package/libkcapi/libkcapi.mk                  |  2 +-
 >> 3 files changed, 2 insertions(+), 56 deletions(-)
 >> delete mode 100644 package/libkcapi/0001-apps-kcapi-hasher.c-fix-build-with-gcc-8.2.x.patch

 > Applied to master, thanks.

That apparently never happened, so I have instead applied it to next -
Thanks.

-- 
Bye, Peter Korsgaard
