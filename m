From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 27 Jan 2009 07:31:52 +0100
Subject: [Buildroot] Newbie question
In-Reply-To: <497EA507.6060505@iwtech.com.au>
References: <497EA507.6060505@iwtech.com.au>
Message-ID: <20090127073152.0571b3ae@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jan 2009 17:09:11 +1100
Paul Jones <paul.jones@iwtech.com.au> wrote:

> How/Where do I set the board name?
>

It is set for some targets in a Makefile in a sub directory beneath
target/devices/...

Perhaps doing make BOARD_NAME=foobar works

-- 
Best regards,
Hans-Christian Egtvedt
