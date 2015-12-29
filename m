From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:03:10 +0100
Subject: [Buildroot] [PATCH 1/2] libfuse: switch to github
In-Reply-To: <1451391159-9906-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451391159-9906-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151229170310.3d87cf46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 29 Dec 2015 09:12:38 -0300, Gustavo Zacarias wrote:
> The project moved to github, so point the homepage and download URL
> there.
> Use direct download link since the helper can't handle the re-uploaded
> release files, and add a comment that it might make sense to switch to
> it once a new release is made.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libfuse/Config.in    | 2 +-
>  package/libfuse/libfuse.hash | 1 +
>  package/libfuse/libfuse.mk   | 3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)

Both applied. However, I've removed the comment in the .mk file about
switching to the github helper on bump. If they continue to upload
their own release tarballs on github, then we prefer to use these
instead of the github helper, so the comment didn't make much sense in
that respect.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
