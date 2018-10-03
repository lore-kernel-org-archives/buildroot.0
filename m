From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Oct 2018 07:52:24 +0300
Subject: [Buildroot] [PATCH v1 2/3] qt5serialbus: fix 5.6.3 license file
 hashes
In-Reply-To: <20181002211637.2356-2-ps.report@gmx.net>
References: <20181002211637.2356-1-ps.report@gmx.net>
 <20181002211637.2356-2-ps.report@gmx.net>
Message-ID: <20181003045224.wlrhhkgyv2tj3pqg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Oct 02, 2018 at 11:16:36PM +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   ERROR: LICENSE.FDL has wrong sha256 hash:
>   ERROR: expected: ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d
>   ERROR: got     : f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d
> 
> [1] http://autobuild.buildroot.net/results/f8dba48bc1e71332f3983e78c40989e5f864abf3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
> 
> diff --git a/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
> new file mode 100644
> index 0000000000..574fcc5294
> --- /dev/null
> +++ b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
> @@ -0,0 +1,5 @@
> +# Hashes for license files:
> +sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> +sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
> +sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
> +sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL

Shouldn't the tarball hash move also here? Having the 5.6.x tarball hash in 
the default .hash file is confusing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
