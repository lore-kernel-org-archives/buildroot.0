From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:15:27 +0100
Subject: [Buildroot] [PATCH 1/2] binutils: Also install libopcodes in
 staging
In-Reply-To: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
References: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
Message-ID: <20150102191527.3fc681fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Wed,  6 Aug 2014 01:00:09 +0200, Paul Cercueil wrote:
> This library will be used later in the "lightning" package.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/binutils/binutils.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
