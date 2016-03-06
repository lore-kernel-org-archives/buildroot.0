From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 23:22:48 +0100
Subject: [Buildroot] [RFC PATCH 1/1] scripts: Add gen-package.py
In-Reply-To: <1443426394-13595-2-git-send-email-judge.packham@gmail.com>
References: <1443426394-13595-1-git-send-email-judge.packham@gmail.com>
 <1443426394-13595-2-git-send-email-judge.packham@gmail.com>
Message-ID: <20160306232248.4d37bcd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Mon, 28 Sep 2015 20:46:34 +1300, Chris Packham wrote:
> gen-package.py can be used to generate the initial skeleton Config.in
> and <package>.mk for a package based on its download URL.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  support/scripts/gen-package.py | 266 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 266 insertions(+)
>  create mode 100755 support/scripts/gen-package.py

Sorry for the very very slow feedback. To be honest, my opinion on this
is that a script that just generates the skeleton of a package is not
very useful.

What I find useful however are scripts to generate working packages
like we already have for CPAN Perl modules (scancpan script), and like
we will probably have for Python (see
http://patchwork.ozlabs.org/patch/501204/).

Another thing that would be useful is a "checkpackage" script, that
runs a bunch of verifications on a package (proper indentation, license
information filled in, etc.). But it is not trivial to do if you want
to check useful things.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
