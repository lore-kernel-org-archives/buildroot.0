From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 7 Oct 2015 10:36:55 +0200
Subject: [Buildroot] [PATCH v6 2/3] opencv3: use
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS instead of replicate python-numpy
 depends
In-Reply-To: <1444203799-16230-2-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
 <1444203799-16230-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMJ2HgS+GkHe=hs_KiWhd1pSpKuMSnsUP3CbLhOEDMv5+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 7, 2015 at 9:43 AM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> Opencv3 select python-numpy. To reduce CPU arch dependencies, an hidden
> variable has been added to python-numpy package. This patch propagate this
> modification.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>
