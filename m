From: Ashwin Bihari <abihari@gmail.com>
Date: Tue, 17 Oct 2006 15:36:20 -0400
Subject: [Buildroot] libgcc_s.so.1 missing from filesystem
In-Reply-To: <20061017190401.GB19820@codepoet.org>
References: <452CE9EC.4050101@lambsys.com>
	<20061011132702.GL6271@igloo.df.lth.se>
	<1f11a5490610110630i47847d40v3800b95043f0742f@mail.gmail.com>
	<20061017190401.GB19820@codepoet.org>
Message-ID: <1f11a5490610171236vc0728cbt2fd2d38b6f605db1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/17/06, Erik Andersen <andersen@codepoet.org> wrote:
>
> On Wed Oct 11, 2006 at 09:30:42AM -0400, Ashwin Bihari wrote:
> > I haven't narrowed it down to exactly which version of Buildroot stopped
> > deploying the libgcc_so.1, but I've found that an older cataloged
> version in
> > our source control was deploying that library properly. The newer
> version of
> > buildroot tends to skip over a few other libraries as well.
>
> details?
>
> -Erik
>
> Erik,

My .config is attached and I'm using the snapshot of Buildroot from Oct 9th.


Thanks

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061017/718e20fe/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 9938 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061017/718e20fe/attachment.obj 
