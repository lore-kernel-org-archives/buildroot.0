From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:18:56 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain-external: improve musl
 external check
In-Reply-To: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
References: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
Message-ID: <20170321231856.014bc6a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 08:56:10 +0300, Ilya Kuzmich wrote:
> Test whether musl used or not: compile minimal C program and check if
> interpreter contains /lib/ld-musl.
> 
> Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>

This doesn't look bad, but what is the motivation behind the change? Is
the current check not working for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
