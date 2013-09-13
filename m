From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 13 Sep 2013 18:07:06 +0200
Subject: [Buildroot] [RFCv1 04/11] toolchain: move helpers.mk into
	toolchain-external/
In-Reply-To: <1378416469-17708-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5233382A.2070304@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> The helpers.mk file is no longer used by the Crosstool-NG backend, so
> it is moved into the toolchain/toolchain-external/ directory.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   toolchain/{ => toolchain-external}/helpers.mk | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename toolchain/{ => toolchain-external}/helpers.mk (100%)

Ok, but you're still including this file. The inclusion is removedin
later patches, it should be done here.This is just to improve
bisectability, I'm ok with the idea.

Luca
