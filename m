From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 23:18:51 +0100
Subject: [Buildroot] [PATCH 1/2] zeromq: bump to version 4.1.3
In-Reply-To: <1448993679-15036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448993679-15036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215231851.28b5d278@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  1 Dec 2015 15:14:38 -0300, Gustavo Zacarias wrote:
> Add upstream patch to fix build failure of zeromq with latest
> libsodium, since sodium_init() has a retval and is now declared to warn
> on unused result, with zeromq treating warnings as errors.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...return-code-of-sodium_init-is-not-checked.patch | 73 ++++++++++++++++++++++
>  package/zeromq/zeromq.hash                         |  6 +-
>  package/zeromq/zeromq.mk                           |  2 +-
>  3 files changed, 77 insertions(+), 4 deletions(-)
>  create mode 100644 package/zeromq/0003-Problem-return-code-of-sodium_init-is-not-checked.patch

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
