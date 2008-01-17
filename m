From: Joe <zentrale.at.work@gmail.com>
Date: Thu, 17 Jan 2008 15:52:19 +0100
Subject: [Buildroot] Where to add/locate board support?
Message-ID: <478F6BA3.9000204@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

Currently i'm in the task of adding support for our custom board to 
buildroot, hence my question:
Where is the right place to add it? As we're using a RM9200 CPU, it 
could be located below target/devices/Atmel, for the folders in 
target/devices look to me more like CPUI vendors, not board vendors. Or 
should it got to target/devices/our_company_name/our_board_name?
But that would seem pretty oversized to me, for we're on really low 
production count, but i'd relly like to get things done right in the 
buildroot-way...

Thanks, Joe

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at gmail.com

watch out for:
www.rocksociety.de
