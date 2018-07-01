From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:41:20 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add optional libevent
 dependency
In-Reply-To: <20180610135434.27878-1-fontaine.fabrice@gmail.com>
References: <20180610135434.27878-1-fontaine.fabrice@gmail.com>
Message-ID: <20180701144120.7a29a934@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 15:54:34 +0200, Fabrice Fontaine wrote:
> libevent is supported since 2.3.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libwebsockets/libwebsockets.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
