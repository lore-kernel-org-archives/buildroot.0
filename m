From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Sep 2013 19:50:08 +0200
Subject: [Buildroot] [RFCv1 04/11] toolchain: move helpers.mk into
	toolchain-external/
In-Reply-To: <1378416469-17708-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWDqr4NN6Q-firhnyCR1d2_BN+vzRKMtEaYM7YDAwds0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The helpers.mk file is no longer used by the Crosstool-NG backend, so
> it is moved into the toolchain/toolchain-external/ directory.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/{ => toolchain-external}/helpers.mk | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename toolchain/{ => toolchain-external}/helpers.mk (100%)
>
> diff --git a/toolchain/helpers.mk b/toolchain/toolchain-external/helpers.mk
> similarity index 100%
> rename from toolchain/helpers.mk
> rename to toolchain/toolchain-external/helpers.mk

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
