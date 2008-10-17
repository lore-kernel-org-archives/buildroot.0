From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Oct 2008 12:24:09 +0200
Subject: [Buildroot] [PATCH 4/9] Add Xilinx UARTLITE and MPC5200 PSC
	device files (serial	ports)
In-Reply-To: <20081016203235.15826.70028.stgit@localhost.localdomain> (Grant
	Likely's message of "Thu\, 16 Oct 2008 14\:32\:35 -0600")
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203235.15826.70028.stgit@localhost.localdomain>
Message-ID: <87iqrrr03a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Likely <grant.likely@secretlab.ca> writes:

 Grant> From: Grant Likely <grant.likely@secretlab.ca>
 Grant> The Xilinx UART Lite and MPC5200 Programmable Serial Controller (PSC)
 Grant> devices have dedicated major/minor numbers.  Add them to the device
 Grant> table data file so they get are present in the root filesystem
 Grant> ---

I was convinced that I had done this long time ago, but I apparently
only added them to /etc/securetty ..

Anyway, thanks - Committed as r23701.

-- 
Bye, Peter Korsgaard
