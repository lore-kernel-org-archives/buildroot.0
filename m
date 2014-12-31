From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 15:14:07 +0100
Subject: [Buildroot] [PATCH] libvncserver: OpenSSL support needs NPTL
 thread support
In-Reply-To: <1419784494-23416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419784494-23416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141231151407.098dc221@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Dec 2014 17:34:54 +0100, Thomas Petazzoni wrote:
> The OpenSSL support of libvncserver already has a dependency on thread
> support, but it in fact requires NPTL threading.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/be2/be20dec9ffe7de3adc46a834852b20353d39baff/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libvncserver/libvncserver.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
