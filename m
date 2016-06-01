From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:41:29 +0200
Subject: [Buildroot] [PATCH 2/3] package/go: Enable MIPS support
In-Reply-To: <c138dede8cf5d38117bdbff2bc3dfa796d904671.1463696779.git.geoff@infradead.org>
References: <cover.1463696779.git.geoff@infradead.org>
 <c138dede8cf5d38117bdbff2bc3dfa796d904671.1463696779.git.geoff@infradead.org>
Message-ID: <20160601234129.7b5335c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 22:33:25 +0000, Geoff Levand wrote:
> Enable go language support for mips64 and mips64el (mips64le), which
> were added in go-1.6.2.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/go/Config.in.host | 2 +-
>  package/go/go.mk          | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
