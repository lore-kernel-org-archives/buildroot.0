From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:44:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuchess: needs c++
In-Reply-To: <1430080308-2444-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430080308-2444-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426224415.0f881a1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 22:31:48 +0200, Bernd Kuhls wrote:
> Quoted from ChangeLog:
> 
> 2013-11-23  Antonio Ceballos  <aceballos@gmail.com>
> [...]
>     * doc/gnuchess.texi: frontend no longer compiled in C; now in C++.
> 
> Fixes
> http://autobuild.buildroot.net/results/04e/04e7c14c20f0e056e63a712be3821a3f5c94cff1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnuchess/Config.in |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
