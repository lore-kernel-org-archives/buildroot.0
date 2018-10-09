From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 09:47:09 +0200
Subject: [Buildroot] [PATCH v1 3/3] qt5serialport: fix 5.6.3 license
 file hashes
In-Reply-To: <20181002211637.2356-3-ps.report@gmx.net>
References: <20181002211637.2356-1-ps.report@gmx.net>
 <20181002211637.2356-3-ps.report@gmx.net>
Message-ID: <20181009094709.605b6eb5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Oct 2018 23:16:37 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   ERROR: LICENSE.FDL has wrong sha256 hash:
>   ERROR: expected: ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d
>   ERROR: got     : e1251235ce9853eecfecfa905da9ee29e9b76e4db2a1c9c4a20699f460419b08
> 
> [1] http://autobuild.buildroot.net/results/320db38e94d68b2ea4451c3cc0bd7742c125cedb
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5serialport/5.6.3/qt5serialport.hash | 7 +++++++
>  package/qt5/qt5serialport/qt5serialport.hash       | 5 -----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  create mode 100644 package/qt5/qt5serialport/5.6.3/qt5serialport.hash

Applied to master, I also split the hashes of the 5.11.2 license files
in a separate hash file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
