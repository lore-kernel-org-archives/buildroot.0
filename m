From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 12 Oct 2018 21:32:43 +0200
Subject: [Buildroot] Clang libsanitizer
In-Reply-To: <CANQCQpZHKtsQxYOZGGyboMHQQMsaRA_oMuMPvqXDEuXghXscFw@mail.gmail.com>
References: <CANQCQpZHKtsQxYOZGGyboMHQQMsaRA_oMuMPvqXDEuXghXscFw@mail.gmail.com>
Message-ID: <7b6880c1-6029-6009-5058-048cd16a2b11@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

I'm adding Valentin in Cc.

Le 12/10/2018 ? 20:58, Matthew Weber a ?crit?:
> I'm starting to work with the libfuzzer
> (https://github.com/google/fuzzer-test-suite) project and was
> wondering if you've looked at adding the compiler-rt package to
> Buildroot?  It looks like that would require some additional changes
> to the Clang package and a generic pkg type for compiler-rt which
> would cross build the libraries for use. (maybe the start of a set of
> hooks for llvm/clang building of packages)

Valentin has finished his internship and there is no other work planned on
llvm/clang side.

I don't know if you had a look at Valentin's article:
http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot

He worked on opencl and VC4 support but only opencl patches has been submitted
on the mailing list. I can send VC4 work if someone is interested.

There is also libcxx package from Norbert Lange
http://patchwork.ozlabs.org/patch/928897/

Maybe I can take a look during the next Buildroot meeting?

Best regards,
Romain

> 
> Matt
> 
