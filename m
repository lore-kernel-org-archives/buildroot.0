From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Oct 2018 09:35:26 +0200
Subject: [Buildroot] [PATCH 1/1] rtl8188eu: bump to latest commit
In-Reply-To: <20181002154536.32623-1-william@willeponken.me> ("William
 =?utf-8?Q?Wennerstr=C3=B6m=22's?= message of "Tue, 2 Oct 2018 17:45:36
 +0200")
References: <20181002154536.32623-1-william@willeponken.me>
Message-ID: <87sh1nzdmp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Wennerstr?m <william@willeponken.me> writes:

 > The rtl8188eu driver wouldn't build due to Linux kernel API changes.
 > Several fixes for API changes to Linux kernel >=4.11 has been commited
 > to the repository.

 > I have bumped to the latest commit and verified that it builds on master
 > (also successfully built on the 2018.08 branch).

 > Signed-off-by: William Wennerstr?m <william@willeponken.me>

Committed, thanks.

It would be good if you could send a patch to add a hash entry for the
COPYING file as well:

>>> rtl8188eu 4b0ecca485b9f11f58670b69aa9f90ecad7da02f Collecting legal info
ERROR: No hash found for COPYING

-- 
Bye, Peter Korsgaard
