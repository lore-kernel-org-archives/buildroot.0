From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 6 Jan 2018 22:34:08 -0600
Subject: [Buildroot] [PATCH] libselinux: set PREFIX to generate proper
 .pc file
In-Reply-To: <20180106145249.3090-1-marcus.folkesson@gmail.com>
References: <20180106145249.3090-1-marcus.folkesson@gmail.com>
Message-ID: <CAFt09wO+yK+C_WwN6W0vwbz+A_SdSx2wkq5_PRKgoVArRwU7Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,

On Sat, Jan 6, 2018 at 8:52 AM, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:

Please add a link to the autobuilder failure for libostree that this resolves.

I tested both one of the build failures and test-pkg with the
following as checkpolicy depends on libsepol/libselinux:
BR2_PACKAGE_HOST_CHECKPOLICY=y
BR2_PACKAGE_CHECKPOLICY=y
BR2_PACKAGE_LIBSEMANAGE=y

Tested-by: Matt Weber <matt@thewebers.ws>
