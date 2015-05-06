From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:35:10 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyqt: fix opengl build failure
In-Reply-To: <1430924376-26750-1-git-send-email-gwenj@trabucayre.com>
References: <1430924376-26750-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150506213510.667a3ea7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Wed,  6 May 2015 16:59:36 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Fix:
> http://autobuild.buildroot.net/results/206/2062208c171207428c9121215971e00c52bf306a/
> 
> According to configure-ng.py, PyQt_NoOpenGLES must be added to qtdetail when
> QT_OPENGL_ES is set.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/python-pyqt/python-pyqt.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied after adding a comment explaining the weird things happening
with the double negation. Thanks for the investigation and fix!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
