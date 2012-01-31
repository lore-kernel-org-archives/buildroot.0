From: Will Newton <will.newton@gmail.com>
Date: Tue, 31 Jan 2012 10:43:22 +0000
Subject: [Buildroot] [PATCH 13/14] libelementary: Add new package
In-Reply-To: <87aa56i42j.fsf@macbook.be.48ers.dk>
References: <CAFbHwiTeF+Q5AT5hPws9M=S2cdtc6_Vq2mNcf+u8vu_7UksOBg@mail.gmail.com>
 <87aa56i42j.fsf@macbook.be.48ers.dk>
Message-ID: <CAFbHwiRHoekzU1mdyOhcTTqsVMf1RS67fwFB__9eYGv3QmHgBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 29, 2012 at 9:36 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> ?Will> b/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
> ?Will> new file mode 100644
> ?Will> index 0000000..9b81ab6
> ?Will> --- /dev/null
> ?Will> +++ b/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
> ?Will> @@ -0,0 +1,10 @@
> ?Will> +index_example01 requires a dict.txt file containing strings that does
> ?Will> not seem to be
> ?Will> +included in the snapshot. Add a dumym file to allow it to build.
>
> Have these been sent upstream? Please add a git-style Signed-off-by line
> in the patch header in the future.

I believe it is fixed in upstream svn. The snapshots seem quite rarely
made (annually?) so it may be some time before a fix is available in a
tarball. There is the option of switching to an svn release but that
can be a slippery slope when you have a number of interconnected
packages like this.

Thanks for your fixes to my patches!
