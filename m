From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 28 Sep 2011 12:18:51 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
References: <000301cc7486$0778f8f0$166aead0$@com>
 <20110916184409.2b4f53ae@skate> <001601cc76d6$7c3d1ac0$74b75040$@com>
 <20110919224628.173080cd@skate> <op.v15jbakh705kjs@rico>
Message-ID: <op.v2ij9pax705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.09.2011, 11:29 Uhr, schrieb Rico Bachmann  
<bachmann@tofwerk.com>:

> Am 19.09.2011, 22:46 Uhr, schrieb Thomas Petazzoni  
> <thomas.petazzoni@free-electrons.com>:
>>
>> Can you post a proper patch (sent with git send-email so that it
>> doesn't get screwed up by your e-mail client) so that we can test and
>> help you in fixing the problem?
>>
>> Thanks!
>>
>> Thomas
>
> As soon as I've done a proper patch, i will send it.
> But I could use a moment. I'm really a newbie in that section

Is there a good tutorial to use git send-email, at the moment i have a  
patch
that allows me to build my rootfs with the libfcgi.
I attached the patches without git send-email. I hope it's not totaly  
screwed up.

How can i use the patch automatically in buildroot?
it should patch the make files from the libfcgi package after extracting  
them from the tarball.
At the moment I run make, wait for the error, patch the files, run make  
again...
I think i have to add some commands in the libfcgi.mk file.

And should I commit my integration of libfcgi to the buildroot project?
Maybe there are other people that like to compile some fcgi applications  
directly on the embedded system.

Greez
Rico
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fcgiex.patch
Type: application/octet-stream
Size: 419 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110928/d83722e9/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fcgicf.patch
Type: application/octet-stream
Size: 393 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110928/d83722e9/attachment-0001.obj>
