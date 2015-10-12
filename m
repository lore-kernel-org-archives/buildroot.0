From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 12 Oct 2015 11:54:31 +0100
Subject: [Buildroot] [PATCH] package/liquid-dsp: fix legal-info
In-Reply-To: <1444601192-29389-1-git-send-email-yann.morin.1998@free.fr>
References: <1444601192-29389-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <561B9167.7060800@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 10/11/2015 11:06 PM, Yann E. MORIN wrote:
> The license file is named LICENSE, not COPYING.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/c82/c82baa5549bdca405e0f077c7ab8c77dcec9a582/
>     http://autobuild.buildroot.org/results/9c7/9c76ce4f9d69db1aa67cc9c07e4c5c2e5e8d93e0/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

$ grep ^LIQUID_DSP_LICENSE_FILES package/liquid-dsp/liquid-dsp.mk
LIQUID_DSP_LICENSE_FILES = LICENSE

$ make liquid-dsp-legal-info && echo "OK"
OK
$

Regards,

Vincent.
