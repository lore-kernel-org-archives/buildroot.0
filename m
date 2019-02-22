From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:27:40 +0100
Subject: [Buildroot] [PATCH] systemd: Remove instance name usage in a
 non-template unit file
In-Reply-To: <38ec152c-e716-eadd-1fb6-f79ef46565dd@mind.be> (Arnout
 Vandecappelle's message of "Wed, 20 Feb 2019 23:08:20 +0100")
References: <BL0PR0102MB341236C6A4CD78A8F7710AC5F37D0@BL0PR0102MB3412.prod.exchangelabs.com>
 <38ec152c-e716-eadd-1fb6-f79ef46565dd@mind.be>
Message-ID: <8736ogknyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 20/02/2019 17:35, Gervais, Francois wrote:
 >> Getty startup can fail due to the instance name specifier
 >> being used in a non-template unit file.
 >> 
 >> Fixes:
 >> No getty prompt on boot
 >> 
 >> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>

 >  Applied to master, thanks. I've extended the commit message a little to explain
 > what exactly goes wrong.

 >  Peter, this applies to 2018.11.x as well. Not to 2018.02.x.

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
