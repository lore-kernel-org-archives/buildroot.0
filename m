From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 May 2011 11:42:34 +0200
Subject: [Buildroot] [git commit] Allow several device tables and split
	in two parts our device table
In-Reply-To: <20110517105509.5521276b@surf> (Thomas Petazzoni's message of
	"Tue, 17 May 2011 10:55:09 +0200")
References: <20110510215121.DFA53826FF@busybox.osuosl.org>
	<20110517090426.0bd12953@surf> <87mxilhg3z.fsf@macbook.be.48ers.dk>
	<20110517105509.5521276b@surf>
Message-ID: <87ipt9hddh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Seems like a good idea. The first option shouldn't be named
 Thomas> "device table", but instead "permission table", and the file
 Thomas> device_table.txt could be renamed as well to
 Thomas> permission_table.txt.

 Thomas> We should also preserve the fact that those two options can be
 Thomas> lists, so that one can keep the original permission table, and
 Thomas> add some more entries by specifying a second table.

Sounds good. Care to cook up a patch?

-- 
Bye, Peter Korsgaard
