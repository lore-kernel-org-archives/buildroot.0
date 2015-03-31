From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 14:01:32 +0200
Subject: [Buildroot] [PATCH 1/2] harfbuzz: bump to version 0.9.40
In-Reply-To: <1427802113-31270-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427802113-31270-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150331140132.1c5c12c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 08:41:52 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> And do an autoreconf run since otherwise the libtool patch fails.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 ++
>  package/harfbuzz/harfbuzz.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  create mode 100644 package/harfbuzz/harfbuzz.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
