From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 1 Jun 2018 12:28:00 -0700
Subject: [Buildroot] Include Host Architecture in LLVM_TARGETS_TO_BUILD
Message-ID: <CAMWSM7ibg=mXZdcWopiHA7zUUAubyredT2o=3-N_uEyATQ1bMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

I'm using the Clang compiler frontend to LLVM that you added to
Buildroot (thanks!), and the package that I'm working on building
requires Clang to support the host architecture, as well as the
target.

I was wondering if you knew of a way to detect and enable the host
architecture for LLVM, as I think enabling all supported architectures
would be wasteful.

Best regards,
Joseph
