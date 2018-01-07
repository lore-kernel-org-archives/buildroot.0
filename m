From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 6 Jan 2018 22:34:00 -0600
Subject: [Buildroot] [PATCH] libsepol: set PREFIX to generate proper .pc
 file
In-Reply-To: <20180106145349.3225-1-marcus.folkesson@gmail.com>
References: <20180106145349.3225-1-marcus.folkesson@gmail.com>
Message-ID: <CAFt09wP1X93ZZPv884i9rLJNxH64KLO12jugHUhR7_0CP2kT4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,

On Sat, Jan 6, 2018 at 8:53 AM, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

I tested test-pkg with the following as checkpolicy depends on
libsepol/libselinux:
BR2_PACKAGE_HOST_CHECKPOLICY=y
BR2_PACKAGE_CHECKPOLICY=y
BR2_PACKAGE_LIBSEMANAGE=y

Tested-by: Matt Weber <matt@thewebers.ws>
