From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 20:01:19 +0200
Subject: [Buildroot] [PATCH v3 2/2] ccache: provide capability to do
 initial ccache setup
In-Reply-To: <1398909907-1847-2-git-send-email-danomimanchego123@gmail.com>
References: <1398909907-1847-1-git-send-email-danomimanchego123@gmail.com>
 <1398909907-1847-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140614200119.7a8cf8f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 30 Apr 2014 22:05:07 -0400, Danomi Manchego wrote:
> For example, if your project is known to require more space than the
> default max cache size, then you might want to increase the cache size
> to a suitable amount using the -M (--max-size) option.
> 
> The string you specify here is passed verbatim to ccache.  Refer to
> ccache documentation for more details.
> 
> These initial settings are applied after ccache has been compiled.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
