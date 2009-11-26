From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Thu, 26 Nov 2009 10:06:57 -0500
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <87y6lt8i9z.fsf@macbook.be.48ers.dk>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca><20091125222504.5aa3b23d@surf><!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAE7bH9cGX9lJvelAwnTnzMABAAAAAA==@cimeq.qc.ca>
	<87y6lt8i9z.fsf@macbook.be.48ers.dk>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAInB97M6B19Mk+u3H+uAbgIBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, 

-----Message d'origine-----
De?: Peter Korsgaard [mailto:jacmet at gmail.com] De la part de Peter Korsgaard
Envoy??: 26 novembre 2009 09:37
??: Jonathan dumaresq
Cc?: 'Thomas Petazzoni'; buildroot at busybox.net
Objet?: Re: [Buildroot] jffs2 multiple partition

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

This is what I have. This looks to work. This is the first time I send a
patch... I will attach it to this email. If this is not right. Please let me
know. Since I take this from ATMEL buildroot, I take no credit for this ....

Jonathan

-- 
Bye, Peter Korsgaard

-------------- next part --------------
A non-text attachment was scrubbed...
Name: add-multiple-partition-jffs2.patch
Type: application/octet-stream
Size: 19636 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091126/8493c48b/attachment-0001.obj>
