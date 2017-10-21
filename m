From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 11:47:35 +0200
Subject: [Buildroot] [V2 1/3] prosody: refactor with PROSODY_CONF_OPTS
 variable
In-Reply-To: <20171018164650.514-1-francois.perrad@gadz.org>
References: <20171018164650.514-1-francois.perrad@gadz.org>
Message-ID: <20171021114735.33046964@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 18:46:48 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/prosody/prosody.mk | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Applied to master after re-adding TARGET_CONFIGURE_OPTS in the
environment. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
