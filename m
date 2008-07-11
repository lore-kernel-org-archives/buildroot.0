From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 11 Jul 2008 21:48:02 +1000
Subject: [Buildroot] microcom
In-Reply-To: <4876CC77.1000308@acsatlanta.com>
References: <4876CC77.1000308@acsatlanta.com>
Message-ID: <20080711114802.GA24773@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 10, 2008 at 09:59:03PM -0500, Joseph G. Boike wrote:
> I'm trying to use microcom (the busybox version) to test a gadget serial 
> interface on an at91sam9260 board.
> gadget serial was compiled into the kernel w/ USE_ACM=1.  I can "cat 
> some_text_file > /dev/ttygserial" and the contents of the text file show 
> up on my laptop running hyperterm w/ windows xp.  So I think the link is 
> ok.  But if I do "microcom /dev/ttygserial" the whole board seems to 
> hang.  I haven't found anything short of cycling power to get the board 
> responding.  (Granted I'm using a serial console so once the program 
> starts I can't just kill it from another terminal window.)

Do you use the microcom package, or the microcom utility is busybox?
Maybe you could try the other?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
