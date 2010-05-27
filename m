From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 May 2010 14:31:01 +0200
Subject: [Buildroot] Merge request
In-Reply-To: <20100523105523.225c205b@surf> (Thomas Petazzoni's message of
	"Sun, 23 May 2010 10:55:23 +0200")
References: <20100521102918.0e8b70eb@surf>
	<8739xjr8li.fsf@macbook.be.48ers.dk> <20100523105523.225c205b@surf>
Message-ID: <87bpc1v856.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Sat, 22 May 2010 22:21:13 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> I'm not completely happy about adding that one this late in the
 >> release cycle, but I've committed the other 3 - Thanks!

 Thomas> Why ? This patch isn't modifying any existing code, it just adds new
 Thomas> code. If this code is broken, well, then BeagleBoard support will not
 Thomas> work, but otherwise it wouldn't be supported.

True, but I would like to sort out all the BR2_BOARD_NAME mess before
adding more, and I don't like the xload package using a "random" git
tree.

-- 
Bye, Peter Korsgaard
