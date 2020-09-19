From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:11:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: needs host gcc >= 4.9
In-Reply-To: <20200915175139.400535-1-fontaine.fabrice@gmail.com>
References: <20200915175139.400535-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919221135.253b7a1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 19:51:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit dbe2d2e686281c19739824d4d4faec62187d1779 forgot to add a
> host gcc >= 4.9 dependency on efl (because of host-efl)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f627d44919c20e068e377d7fe113833e2d4d0ad3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
