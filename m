From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 15:36:40 +0100
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAE7bH9cGX9lJvelAwnTnzMABAAAAAA==@cimeq.qc.ca>
	(Jonathan dumaresq's message of "Thu\,
	26 Nov 2009 09\:30\:24 -0500")
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
	<20091125222504.5aa3b23d@surf>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAE7bH9cGX9lJvelAwnTnzMABAAAAAA==@cimeq.qc.ca>
Message-ID: <87y6lt8i9z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan dumaresq <jdumaresq@cimeq.qc.ca> writes:

Hi,

 Jonathan> The main idea is to put the usr part in the 8MB serial flash.
 Jonathan> I don't know if this is something that buildroot should offer
 Jonathan> ? if yes, I can try to make a patch that add this
 Jonathan> functionality to buildroot ?  Jonathan

The question is how to generalize this and make is simple to
use/understand. My initial feeling is that for something as specialized
as this we should just make it easy to do outside BR (like we do with
the tarball target), instead of add a lot of complexity to BR/Kconfig.

But send the patch to the list once you're done, and I'll take a look at
it.

-- 
Bye, Peter Korsgaard
