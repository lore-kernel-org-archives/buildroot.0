From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 29 Oct 2019 06:02:07 -0500
Subject: [Buildroot] [External] [PATCH v3 1/1] ima-evm-utils: Add as new
 package, version 1.2.1
In-Reply-To: <20191029003436.23972-1-petr.vorel@gmail.com>
References: <20191029003436.23972-1-petr.vorel@gmail.com>
Message-ID: <CANQCQpaTfKCHk9a7TW3r4B5dNW53cG1U6ZP1CPcwQzmcSwANvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr,

On Mon, Oct 28, 2019 at 7:35 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> + add myself as a maintainer.
>
> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

$ ./utils/test-pkg -p ima-evm-utils -k -d dl -d ima_testbuild
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
