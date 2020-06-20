From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:22:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/janus-gateway: fix libogg
 dependency
In-Reply-To: <20200620143501.853894-1-fontaine.fabrice@gmail.com>
References: <20200620143501.853894-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620222250.473ce2a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 16:35:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libogg is not only used for voicemail plugin, it is an optional
> dependency of:
> - audiobridge plugin since version 0.9.3 and
>   https://github.com/meetecho/janus-gateway/commit/53761d07c5456424d368c708fda2757e6606a4bf
> - streaming plugin since version 0.9.3 and
>   https://github.com/meetecho/janus-gateway/commit/d9aa1cec84c662f2f7fda025ee023f6dec927bdc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/janus-gateway/janus-gateway.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
