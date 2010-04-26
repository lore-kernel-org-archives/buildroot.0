From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Apr 2010 09:26:53 +0200
Subject: [Buildroot] /dev/bus/usb on BR
In-Reply-To: <i2s532dd5841004260024r41596833pd07cced09efc5c28@mail.gmail.com>
	(Ravi Kumar Kulkarni's message of "Mon, 26 Apr 2010 13:09:52 +0545")
References: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
	<m2k532dd5841004252352jdc881088y588d57d5fbde19a6@mail.gmail.com>
	<87pr1m4r4e.fsf@macbook.be.48ers.dk>
	<i2s532dd5841004260024r41596833pd07cced09efc5c28@mail.gmail.com>
Message-ID: <87hbmy4qte.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ravi" == Ravi Kumar Kulkarni <ravilinux4u@gmail.com> writes:

Hi,

 Ravi> i meant at BR compile time (static device nodes) from device
 Ravi> table (target/device/Atmel/root/device_table.txt).im using
 Ravi> at91sam9261ek.  even though there is sda1,sda2 in device table
 Ravi> but on my target /dev/dir it was not there.

And sometimes just those 2 nodes are not created but the rest is? This
is the first time I hear something like this - Could you send your
.config please, so I can try to figure out what goes wrong.

-- 
Bye, Peter Korsgaard
