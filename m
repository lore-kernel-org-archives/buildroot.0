From: Koenraad Lelong <buildroot@ace-electronics.be>
Date: Fri, 23 Feb 2007 08:16:06 +0100
Subject: [Buildroot] gdk-pixbuf
In-Reply-To: <45DDD250.5070300@gnat.ca>
References: <45DD92A8.4020802@ace-electronics.be> <45DDD250.5070300@gnat.ca>
Message-ID: <45DE94B6.7060807@ace-electronics.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathanael D. Noblet schreef:
> Koenraad Lelong wrote:
>> Hi,
>> I'm trying to implement gdk-pixbuf. When it compiles it complains it 
>> needs libm.so.6 and libc.so.6.
>> What's the difference between those and libm.so.0 and libc.so.0 which 
>> I have ? Can I simply make symlinks ?
> 
> No expert, but I'm pretty sure that means you've linked against the host 
> libs of glibc and friends instead of uclibc. Symlinks won't help you.
I see, I didn't think of that (pretty new to this stuff). I'll have to 
amend my mk-file.
Thanks,
Koenraad Lelong.
