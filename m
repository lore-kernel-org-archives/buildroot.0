From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:08:56 +0200
Subject: [Buildroot] [PATCH/next] package/python-modbus-tk: bump to
 version 1.1.1
In-Reply-To: <1590659333-10284-1-git-send-email-pjtexier@koncepto.io>
References: <1590659333-10284-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200529230856.1ce7ec5c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 11:48:53 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This includes the following changes:
> 
> 5732f86 1.1.1
> d8e9b32 pep8
> 4795bc7 Add Jackson Matheson to contributors
> 26db934 Merge branch 'master' of https://github.com/ljean/modbus-tk
> 837a12b Merge pull request #125 from jacksonmatheson/master
> 07b06f8 Fixed READ_WRITE_MULTIPLE_REGISTERS, added write_starting_address_FC23
> 
> Also update hash file formatting (2 spaces).
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/python-modbus-tk/python-modbus-tk.hash | 8 ++++----
>  package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
