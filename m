From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:35:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.1
In-Reply-To: <20200205170532.32004-1-titouan.christophe@railnova.eu>
References: <20200205170532.32004-1-titouan.christophe@railnova.eu>
Message-ID: <20200205203514.3880713a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Feb 2020 18:05:32 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This fixes CVE-2020-7044:
> In Wireshark 3.2.x before 3.2.1, the WASSP dissector could crash.
> This was addressed in epan/dissectors/packet-wassp.c by using
> >= and <= to resolve off-by-one errors.  
> 
> Also change the hash file to the new spacing convention introduced
> by Yann E. Morin.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/wireshark/wireshark.hash | 8 ++++----
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
