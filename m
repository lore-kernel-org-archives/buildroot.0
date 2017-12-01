From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:24:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump to version
 0.3.1.9
In-Reply-To: <20171201174603.14173-1-bernd.kuhls@t-online.de>
References: <20171201174603.14173-1-bernd.kuhls@t-online.de>
Message-ID: <20171201222403.5c1461f1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 18:46:03 +0100, Bernd Kuhls wrote:
> Release notes:
> https://blog.torproject.org/new-stable-tor-releases-security-fixes-0319-03013-02914-02817-02516
> 
> Fixes CVE-2017-8819, CVE-2017-8820, CVE-2017-8821, CVE-2017-8822
> and CVE-2017-8823.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/tor.hash | 2 +-
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
