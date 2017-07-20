From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:30:27 +0200
Subject: [Buildroot] [PATCH v8 01/10] support/scripts: relocate-sdk.sh
 now uses a normal pipe to find strings
In-Reply-To: <1500561321-6623-2-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-2-git-send-email-wg@grandegger.com>
Message-ID: <20170720223027.6345c8ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:35:12 +0200, Wolfgang Grandegger wrote:
> The normal shell does not support the bashism "< <(...)". Therefore
> we use a normal pipe to find files containing a specific string.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/misc/relocate-sdk.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
