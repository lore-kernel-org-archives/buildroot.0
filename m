From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:50:18 +0100
Subject: [Buildroot] [PATCH/next] test_lxc.py: fix code style
In-Reply-To: <1574713802-20461-1-git-send-email-pjtexier@koncepto.io>
References: <1574713802-20461-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191125215018.32b1bd25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 21:30:01 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fix these warnings:
> 
> E122 continuation line missing indentation or outdented
> E127 continuation line over-indented for visual indent
> E265 block comment should start with '# '
> E302 expected 2 blank lines, found 1
> F401 'pexpect' imported but unused
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/360824861
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  support/testing/tests/package/test_lxc.py | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
