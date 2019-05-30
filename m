From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:29:59 +0200
Subject: [Buildroot] [PATCH 13/19] package/ncurses: add hash for license
 file
In-Reply-To: <20190530165911.4c425d77@thl530.multi.box> (Thomas Huth's message
 of "Thu, 30 May 2019 16:59:11 +0200")
References: <20190529033537.128311-1-aduskett@gmail.com>
 <20190529033537.128311-14-aduskett@gmail.com>
 <20190530165911.4c425d77@thl530.multi.box>
Message-ID: <875zprzic8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Huth <huth@tuxfamily.org> writes:

 > Am Tue, 28 May 2019 23:35:31 -0400
 > schrieb aduskett at gmail.com:

 >> From: Adam Duskett <Aduskett@gmail.com>
 >> 
 >> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 >> ---
 >> package/ncurses/ncurses.hash | 3 +++
 >> 1 file changed, 3 insertions(+)
 >> 
 >> diff --git a/package/ncurses/ncurses.hash
 >> b/package/ncurses/ncurses.hash index 045625ae3b..f6683959fd 100644
 >> --- a/package/ncurses/ncurses.hash
 >> +++ b/package/ncurses/ncurses.hash
 >> @@ -1,2 +1,5 @@
 >> # Locally calculated after checking pgp signature
 >> sha256
 >> aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17
 >> ncurses-6.1.tar.gz + +# Locally calculated
 >> +sha256
 >> 3c7bc1dd475a5e5dcc7bdf13268a0313ff69e3765689444eb95b5893f61b3d1e
 >> README

 > Looks like ncurses now also has the license available in a separate
 > file called COPYING ... I'd suggest to change the .mk file to point to
 > that file instead and provide the hash of the COPYING file here.

Agreed. Adum, will you send a patch doing that? In the mean time I have
marked this patch as changes requested in patchwork.

-- 
Bye, Peter Korsgaard
