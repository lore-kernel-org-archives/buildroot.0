From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 19:15:22 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/vlc: Fix strerror_l related
 compile error
In-Reply-To: <1430579634-32527-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430579634-32527-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150502191522.2e520a93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  2 May 2015 17:13:54 +0200, Bernd Kuhls wrote:
> strerror_l is not implemented by uClibc.
> 
> Fixes
> http://autobuild.buildroot.net/results/ae3/ae31f4585d2c2f850473c446f1ccfba7699c711b/
> http://autobuild.buildroot.net/results/504/504cf78a08315e2fc6eaeb9a29ae791972753830/
> http://autobuild.buildroot.net/results/092/09280c5d63da9b8b58916c32e6040a98f7ff0ee8/
> http://autobuild.buildroot.net/results/da6/da62d97ea060ce03db94f59a91d84a235d03e8f0/
> http://autobuild.buildroot.net/results/7a4/7a40f66b3be8cd71a27df04415c4851cd4426cc3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: add configure check for strerror_l (Thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
