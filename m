From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 21:43:36 +0100
Subject: [Buildroot] [PATCH] package/stm32flash: bump to revision 3cebf12
In-Reply-To: <1573585296-15754-1-git-send-email-pjtexier@koncepto.io>
References: <1573585296-15754-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191112214336.7f69552c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 20:01:36 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This includes the following changes:
> 
> 3cebf12 dev_table: add STM32G07xxx/08xxx
> 5ad1f87 Makefile: Check if CC and AR are defined
> ee5b009 Fix comparison between signed and unsigned integer
> 74bfe1a serial_w32: remove always false if-then
> d302abf Add comment on switch fall-through
> 12f06e3 Fix warning for unused parameters with mingw-gcc
> 4957909 Fix compile warning for unused parameters
> 475da89 Fix signed/unsigned comparison
> 68cc278 Fix dev_table for Android compilation
> 2e09c51 Fix indentation warning from GCC 7.1.1
> c4293d3 Flip PEMPTY bit before SW reset on STM32L452
> acf15a2 dev_table: add device STM32L01xxx/02xxx
> 59d08c2 dev_table: add device family H7
> 12bfd33 dev_table: fix flash layout of STM32F72xxx/73xxx
> 0c84669 dev_table: add STM32L45xxx/46xxx
> e2a4f65 dev_table: fix option byte end address for STM32L43xxx/44xxx
> 76da7c4 dev_table: L4: reorder with AN2606 rev 31
> cc70634 dev_table: F0: reorder with AN2606 rev 31
> 8a0d423 dev_table: F4: reorder and align names with AN2606 rev 31
> bc0876d dev_table: fix RAM size for STM32F412xx
> 2783493 Add some more F4/F7/L4 devices
> 27626f5 Add autotools support
> 6b6b6e5 Let user decide length for unknown memory areas
> 671561e Allow read/write to full option byte area and system memory
> 843c6f5 Don't write diagnostics messages to stdout unconditionally
> 3a07489 Don't always print banner to stdout
> cc97bca Treat filenames starting with hyphen correctly
> a1b2fe4 Improve validation of GPIO sequence
> 7683db8 Allow specifying more than 255 pages to erase
> 033aaa8 Report RAM and flash size as maximal values
> 1f10b4e Serial POSIX: Check if tty is already opened by another stm32flash
> 8aa685c Add ctrl-C signal handler
> 3daa90e Print message on failing read/write protect/unprotect
> 7b5b33a Verbose error message on GPIO signal change failure
> d5df420 Add message and fix return code on failed boot entry sequence
> a285a09 Flush port after boot GPIO sequence
> ee7c963 Fix return code from GPIO bootloader exit sequence
> de7332e Fix return code from GPIO bootloader entry sequence
> efeab97 Allow extra delay or no delay at all in GPIO sequences
> d202bd0 Make termios timeout settable via TERMIOS_TIMEOUT_MS define
> 0242da6 Ensure correct precedence of bit and logic comparisons
> 26854ef Fix return value in case of successful protect/unprotect operation
> 3772e95 Fix return code in case of flash failure
> 7a7b4c9 Always run GPIO exit sequence if present
> d581ce8 Put Linux specific GPIO code under conditional compile
> 8c4aa65 dev_table: Mark 0x417, 0x429, 0x427 for no mass-erase
> 2381ce3 Fix parity setting/checking on *BSD and MacOSX
> 5361ed8 Fix for device 0x442: System memory start address
> 
> Also add hash for license file
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/stm32flash/stm32flash.hash | 3 ++-
>  package/stm32flash/stm32flash.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
