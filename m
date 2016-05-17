From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:49:24 +0200
Subject: [Buildroot] [PATCH v3 4/9] python-crossbar: fix
 byte-compilation of .pyc files
In-Reply-To: <1462133720-409-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160517224924.7d0f7aae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 22:15:15 +0200, Thomas Petazzoni wrote:
> For its continuous integration tests, python-crossbar includes one .py
> file that intentionally has a syntax error. Until now, this wasn't
> causing any problem, but with the introduction of a Python
> byte-compilation process that errors out when there is a failure, it
> is going to become a problem.
> 
> We simply add a patch that removes the syntax error, as we don't care
> about it in the context of Buildroot. The problem has been reported
> upstream to see if a better fix is possible.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-Avoid-intentional-syntax-error.patch      | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
