From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 22:56:17 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/gpsd: bump version to 3.16
In-Reply-To: <1454270691-21900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454270691-21900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131225617.4c85600a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 21:04:50 +0100, Bernd Kuhls wrote:
> Removed patch applied upstream:
> http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=3e25e2167beb3936de3986fad9b6c9bdec82b81f
> 
> 0001-Fix-build-against-musl-libc.patch is also not needed anymore after
> this commit:
> http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=95c99f69e026e8c57aecba545e51c97f3b284e75
> 
> The upstream commit included in this version bump
> http://git.savannah.gnu.org/cgit/gpsd.git/commit/libgps.pc.in?id=772eedf8a13c2c0468b1fd94beb5406dbfcb3b6e
> fixes a build error with the location module of the updated
> sconeserver package included in this patch series:
> 
> ../libtool: line 7486: cd: lib: No such file or directory
> libtool:   error: cannot determine absolute directory name of 'lib'
> Makefile:428: recipe for target 'location.la' failed
> make[3]: *** [location.la] Error 1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: also removed 0001-Fix-build-against-musl-libc.patch (Baruch)
> v2: no changes

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
