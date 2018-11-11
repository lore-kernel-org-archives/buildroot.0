From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:10:40 +0100
Subject: [Buildroot] [PATCH 1/1] libkrb5: fix build on riscv
In-Reply-To: <20181111175210.14031-1-fontaine.fabrice@gmail.com>
References: <20181111175210.14031-1-fontaine.fabrice@gmail.com>
Message-ID: <20181111221040.1bd99cd0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Nov 2018 18:52:10 +0100, Fabrice Fontaine wrote:
> Define _REENTRANT otherwise pthread detection will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/39a51d0c3feab74edd8a17c9174d031ccc7ffe1d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkrb5/libkrb5.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
