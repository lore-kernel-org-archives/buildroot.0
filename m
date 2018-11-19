From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:21:20 +0100
Subject: [Buildroot] [PATCH v2 1/1] vmtouch: new package
In-Reply-To: <20181116155253.4233-1-brandon.maier@rockwellcollins.com>
References: <20181115174250.109988-1-brandon.maier@rockwellcollins.com>
 <20181116155253.4233-1-brandon.maier@rockwellcollins.com>
Message-ID: <20181119222120.300e3930@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 09:52:53 -0600, Brandon Maier wrote:
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> 
> ---
> Changes v1 -> v2:
>   - Switch to v1.3.1 and drop patches
>   - Add myself to DEVELOPERS
> ---
>  DEVELOPERS                   |  3 +++
>  package/Config.in            |  1 +
>  package/vmtouch/Config.in    | 11 +++++++++++
>  package/vmtouch/vmtouch.hash |  5 +++++
>  package/vmtouch/vmtouch.mk   | 21 +++++++++++++++++++++
>  5 files changed, 41 insertions(+)
>  create mode 100644 package/vmtouch/Config.in
>  create mode 100644 package/vmtouch/vmtouch.hash
>  create mode 100644 package/vmtouch/vmtouch.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
