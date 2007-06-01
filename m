From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Fri, 01 Jun 2007 11:28:33 +0100
Subject: [Buildroot] Ogg and Vorbis patch part 2.1
In-Reply-To: <20070531214638.GE12010@aon.at>
References: <465AD791.2040108@teamboyce.co.uk> <20070529202507.GC30684@aon.at>
	<465F19D0.6020001@teamboyce.co.uk> <20070531214638.GE12010@aon.at>
Message-ID: <465FF4D1.20709@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> Thanks for the update, but please see below..
>   
>> Regards,
>> Rod Boyce
>>
>>     
>
>   
> you want --exclude='*~'
> Alternatively, a simple "svn diff > ~/mypatch.diff" should do the right
> thing.
>
>   
Bernhard,

If you know a way to get svn diff to work the same way as diff -uN does 
then I am listening.  I have tried passing -N to svn diff but without 
success so that is why I am using just diff.  I have even tried 'svn 
diff --diff-cmd `which diff` -x "-uN --recursive"' but it still does not 
show new files in the diff output.  As for me when I just do svn diff I 
only get changes to files that are on SVN I don't get my new changes.

Attached are all the other suggested changes as these mostly obvious.  
But gnuconfig needs updating and it is gettign in the way of my diffs 
now and I have to exclude yet another directory.

Regards,
Rod Boyce




-------------- next part --------------
A non-text attachment was scrubbed...
Name: libogg-libvorbis.patch
Type: text/x-patch
Size: 7979 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070601/7894b917/attachment.bin 
