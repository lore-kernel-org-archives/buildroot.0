From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 09:50:21 +0100
Subject: [Buildroot] [PATCH v2] uboot: fix binman with a new dependency
In-Reply-To: <20210115170156.917086-1-francois.perrad@gadz.org>
References: <20210115170156.917086-1-francois.perrad@gadz.org>
Message-ID: <CACXmVib9m-3j=O3m7UUBBZXGiUwD0xye-5KgYXzsdLs+E=G8MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 15, 2021 at 6:02 PM Francois Perrad <fperrad@gmail.com> wrote:
>
> since 2021.01, tools/binman is broken.
> tools/binman/control.py imports pkg_resources
> the module pkg_resources is supplied by setuptools,
> so this new dependency is required.
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
