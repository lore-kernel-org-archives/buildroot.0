From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 7 Oct 2015 10:37:39 +0200
Subject: [Buildroot] [PATCH v6 1/3] python-numpy: introduce
 ARCH_SUPPORTS hidden variable
In-Reply-To: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMKpR7FkVvkLiB6NpHFGXxYgS+O-N+s2t=fH1fzgTGYmVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 7, 2015 at 9:43 AM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> Some packages selects python-numpy. This package has a some CPU specific
> code. To simplify and avoid duplicate dependencies this patch introduce an
> hidden ARCH_SUPPORTS variable.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
