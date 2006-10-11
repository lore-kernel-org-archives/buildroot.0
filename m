From: Ashwin Bihari <abihari@gmail.com>
Date: Wed, 11 Oct 2006 09:30:42 -0400
Subject: [Buildroot] libgcc_s.so.1 missing from filesystem
In-Reply-To: <20061011132702.GL6271@igloo.df.lth.se>
References: <452CE9EC.4050101@lambsys.com>
	<20061011132702.GL6271@igloo.df.lth.se>
Message-ID: <1f11a5490610110630i47847d40v3800b95043f0742f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/06, Fredrik Roubert <roubert@df.lth.se> wrote:
>
> On Wed 11 Oct 14:56 CEST 2006, David Lambert wrote:
>
> > A commom problem seems to be that they depend on a library libgcc.so.1
> > which appears in buildroot/build_arm/staging_dir/lib/libgcc_s.so.1,
> > [...] Is there a more elegant solution?
>
> One possible solution is to unset BR2_GCC_SHARED_LIBGCC in the buildroot
> configuration, to get rid of the shared libgcc alltogether.
>
> Information on libgcc can be found here:
>
> http://gcc.gnu.org/onlinedocs/gccint/Libgcc.html
>
> Cheers // Fredrik Roubert
>
>
I haven't narrowed it down to exactly which version of Buildroot stopped
deploying the libgcc_so.1, but I've found that an older cataloged version in
our source control was deploying that library properly. The newer version of
buildroot tends to skip over a few other libraries as well.

Regards

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061011/f685ef7c/attachment.htm 
