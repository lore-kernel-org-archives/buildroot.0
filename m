From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 15 Oct 2014 16:53:49 +0200
Subject: [Buildroot] google-breakpad experiences?
Message-ID: <CAAXf6LWEBuVmnXosLpkjw0O9aVvGCBE2s=9e1PN6W5S7pK98+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Has anyone successfully used google-breakpad on MIPS64 and/or PowerPC targets?

For MIPS64/n32 ABI I had to make a few compilation fixes, but a simple
test program (copied from their wiki) does not provide any dump.

For PowerPC I added some code to make it compile, and although the
support I added is not yet complete, I could build it but it does not
produce any dump either.

On the MIPS version I did some debugging and found that the dumper
child was created but did not seem to run, and thus no dump was taken.

When building for x86_64 (qemu) things worked fine.

Did any of you succeed in using google-breakpad on embedded targets?

Thanks,
Thomas
