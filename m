From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:07:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/stella: needs gcc >= 5
In-Reply-To: <20190317075807.11337-1-fontaine.fabrice@gmail.com>
References: <20190317075807.11337-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317110715.5b672db6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 08:58:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> std::put_time needs gcc 5.x:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54354
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cf5bd2f262b108e4b90b6e31e46c5f82b9aef0a0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/stella/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
