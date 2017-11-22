From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:45:46 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-raven: new package
In-Reply-To: <20171109171417.30187-1-joseph.kogut@gmail.com>
References: <CAGm1_kv4WM_9Ko=tN6psKwAcjLzXDNvHkdcMbZxz8tsmcb2Jeg@mail.gmail.com>
 <20171109171417.30187-1-joseph.kogut@gmail.com>
Message-ID: <20171122224546.07eb63f4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Nov 2017 09:14:17 -0800, Joseph Kogut wrote:
> Changes since v2:
> - remove newlines from Config.in
> - add LICENSE hash
> 
> Changes since v1:
> - reword commit to match upstream style
> - fold the DEVELOPERS modifications into the same commit
> - add Config selections for required python core modules
> - bump version to 6.3.0
> 
> Tested in a clean chroot, events are generated for exceptions, and
> reported to the server configured for the client.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-raven/Config.in         | 12 ++++++++++++
>  package/python-raven/python-raven.hash |  5 +++++
>  package/python-raven/python-raven.mk   | 14 ++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/python-raven/Config.in
>  create mode 100644 package/python-raven/python-raven.hash
>  create mode 100644 package/python-raven/python-raven.mk

Applied to next, thanks.

Also, thanks Yegor for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
