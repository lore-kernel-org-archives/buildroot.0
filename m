From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 17 Oct 2006 13:03:19 -0600
Subject: [Buildroot] libgcc_s.so.1 missing from filesystem
In-Reply-To: <452CE9EC.4050101@lambsys.com>
References: <452CE9EC.4050101@lambsys.com>
Message-ID: <20061017190319.GA19820@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed Oct 11, 2006 at 07:56:12AM -0500, David Lambert wrote:
> I built several utilities including python using buildroot. A commom 
> problem seems to be that they depend on a library libgcc.so.1 which 
> appears in buildroot/build_arm/staging_dir/lib/libgcc_s.so.1, but does 
> not get transferred to the target filesystem. Manually moving it to the 
> target appears to be a workaround. Is there a more elegant solution? 
> What is this library?

Could I have a copy of your buildroot .config file?  I've tested
both with and without BR2_GCC_SHARED_LIBGCC set and both settings
produced working root filesystems for me....

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
