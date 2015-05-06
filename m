From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:33:23 +0200
Subject: [Buildroot] [PATCH 1/1] qt: fix missing target
In-Reply-To: <1430918929-26496-1-git-send-email-gwenj@trabucayre.com>
References: <1430918929-26496-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150506213323.400ba66e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Wed,  6 May 2015 15:28:49 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Fix : 
>  http://autobuild.buildroot.net/results/093/09302c153418c3af6dc4cdd12a0149505cfbca0b/
>  http://autobuild.buildroot.net/results/96f/96f8a9758f0116aec999028fde1b9c983c143809/
> 
> sh target must be provided instead of generic to have the correct QT_NO_FPU
> behaviour.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/qt/qt.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
