From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 16:38:25 +0100
Subject: [Buildroot] [PATCH] libevent: add optional dependency on OpenSSL
In-Reply-To: <1420112396-7686-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1420112396-7686-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150102163825.4a917fcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Jan 2015 12:39:56 +0100, Thomas Petazzoni wrote:
> libevent can optionally use OpenSSL, so add an optional dependency on
> this package to explicit this possibility. This makes sure libevent
> always gets built with OpenSSL support when the OpenSSL package is
> enabled.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libevent/libevent.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
