From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 18:08:41 +0100
Subject: [Buildroot] [PATCH 1/1] OrangePi PC addition to build root
In-Reply-To: <1450962484-90787-1-git-send-email-echaudron@xiot.nl>
References: <1450962484-90787-1-git-send-email-echaudron@xiot.nl>
Message-ID: <20151228180841.598a2d6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eelco Chaudron,

On Thu, 24 Dec 2015 14:08:04 +0100, Eelco Chaudron wrote:
> This is the patch as Thomas requested for the OrangePi PC.
> It should have all changes requested, let me know if I missed something.
> 
> Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>

I've applied your patch, after reworking the commit log. See
https://git.busybox.net/buildroot/commit/?id=d7327c69c8459adf0b878205e0a2ab63c60d02bd.

One possible addition is a readme.txt file in
board/orangepi/orangepipc/ to explain how to use/setup the board with
the result of the Buildroot build. See other readme.txt files in board/
for examples.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
