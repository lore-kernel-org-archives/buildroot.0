From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 09:46:53 +0200
Subject: [Buildroot] [PATCH v1 2/3] qt5serialbus: fix 5.6.3 license file
 hashes
In-Reply-To: <20181002211637.2356-2-ps.report@gmx.net>
References: <20181002211637.2356-1-ps.report@gmx.net>
 <20181002211637.2356-2-ps.report@gmx.net>
Message-ID: <20181009094653.5d4a6849@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Oct 2018 23:16:36 +0200, Peter Seiderer wrote:
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

Applied to master, thanks. I did a follow-up commit to move the 5.11.2
hashes to a per version hash file. I think we should do this for all
Qt5 modules.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
