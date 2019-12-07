From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Dec 2019 12:09:58 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/rauc: select fw_printenv
 for uboot based systems
In-Reply-To: <20191205094238.69841-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Thu, 5 Dec 2019 10:42:38 +0100")
References: <20191205094238.69841-1-titouan.christophe@railnova.eu>
Message-ID: <875zismlx5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > When operating on a uboot based system, rauc interacts with
 > the bootloader environment using fw_printenv and fw_setenv [1].

 > These commands should therefore be present on the target if
 > the system being built uses uboot.

 > [1] See:
 > https://github.com/rauc/rauc/blob/v1.2/src/bootchooser.c#L21-L22
 > https://github.com/rauc/rauc/blob/v1.2/src/bootchooser.c#L644-L645

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2019.02.x, 2019.08.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
