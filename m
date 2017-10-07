From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:13:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiio: add binding for python3
In-Reply-To: <20171005113325.11715-1-bela.becker@pcbdesign.hu>
References: <20171005113325.11715-1-bela.becker@pcbdesign.hu>
Message-ID: <20171007231355.447caf9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 Oct 2017 13:33:25 +0200, B?la Becker wrote:
> Python3 support was added to libiio in version 0.10.
> This commit adds the option to compile libiio bindings if python3 was
> selected instead of python.
> 
> Signed-off-by: B?la Becker <bela.becker@pcbdesign.hu>
> ---
>  package/libiio/Config.in | 2 +-
>  package/libiio/libiio.mk | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
