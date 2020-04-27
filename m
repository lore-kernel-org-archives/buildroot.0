From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:46:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: link with libatomic
 when needed
In-Reply-To: <20200426072116.1594619-1-fontaine.fabrice@gmail.com>
References: <20200426072116.1594619-1-fontaine.fabrice@gmail.com>
Message-ID: <20200427224653.3f024f4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Apr 2020 09:21:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sg3_utils uses __atomic_fetch_add_4 since version 1.45 and
> https://github.com/hreinecke/sg3_utils/commit/e9445f4efc012d37809342ba21f16360a0208f06
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7773ead32375ca9073f45db83dac299aa2edd619
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sg3_utils/sg3_utils.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
