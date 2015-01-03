From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 22:12:25 +0100
Subject: [Buildroot] [PATCH 1/2] libsecret: bump to version 0.18
In-Reply-To: <1420238707-5456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420238707-5456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150103221225.42875707@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  2 Jan 2015 19:45:06 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libsecret/libsecret.hash |  2 ++
>  package/libsecret/libsecret.mk   | 15 +++++++--------
>  2 files changed, 9 insertions(+), 8 deletions(-)
>  create mode 100644 package/libsecret/libsecret.hash

Applied, thanks. It would have been good to mention in the commit log
that you also fixed up the indentation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
