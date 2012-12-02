From: Santhosh Ramani <srcoolz@gmail.com>
Date: Sat, 1 Dec 2012 19:44:03 -0600
Subject: [Buildroot] Qt library difference between E.so and just .so
In-Reply-To: <CAExDhvZF6ZwmdpdWdgcmPp-pHFHkKZtT9SFeS1fC9W1qekxmjA@mail.gmail.com>
References: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
 <CAExDhvZF6ZwmdpdWdgcmPp-pHFHkKZtT9SFeS1fC9W1qekxmjA@mail.gmail.com>
Message-ID: <CADKZYY+KTeh1qdbnzzj1th=n5TrwuzT+2RhvxzaK6-Wp8JN88w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thiago,

Thanks a lot for your response, I thought about it too. I actually changed
the qk.mk to copy all the E version files, instead to see if the the
example would run, and then I got this error:

*error while loading shared libraries: libgthread-2.0.so.0: cannot open
shared object file: No such file or directory*

Any pointers on this one??

Also I'm thinking when I compile my Qt applications, I'm gonna use the new
4.8.2 library so that the applications don't use the TI version. Would this
approach work?

Thanks a lot
Regards

Santhosh


-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121201/47a8afb6/attachment-0001.html>
