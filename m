From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 17:09:13 +0200
Subject: [Buildroot] [PATCH 1/2] igmpproxy: fix license
In-Reply-To: <20180921212907.17677-1-fontaine.fabrice@gmail.com>
References: <20180921212907.17677-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923170913.7c3a8294@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 23:29:06 +0200, Fabrice Fontaine wrote:
> mrouted part of igmpproxy is licensed under BSD-3-Clause so add this in
> IGMPPROXY_LICENSE and add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/igmpproxy/igmpproxy.hash | 3 +++
>  package/igmpproxy/igmpproxy.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
