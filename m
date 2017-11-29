From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:22:58 +0100
Subject: [Buildroot] [PATCH 1/1] samba4: ensure that copied cache.txt is
 writable
In-Reply-To: <1511924124-3938-1-git-send-email-danomimanchego123@gmail.com>
References: <1511924124-3938-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20171129212258.066f2629@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 21:55:24 -0500, Danomi Manchego wrote:
> If the Buildroot tree is read-only, then cache.txt is copied read-only into
> the build directory, and the configuration step fails.  Fix this in the
> same way we do in other places, by opening permissions as we copy the file
> using $(INSTALL).
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/samba4/samba4.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
