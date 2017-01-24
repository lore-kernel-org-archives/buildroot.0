From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Jan 2017 16:10:30 +0100
Subject: [Buildroot] Usage of kdump/kexec in embedded systems
Message-ID: <CAAXf6LU_mzCK9mV9czAep6w_5pAXgjVHrJD67EivXMyEi_tLMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to understand if and how some of you are using kernel
crash dump features like kexec/kdump / kexec-lite to capture enough
information to analyze kernel panics in embedded systems. Any
information in this respect would be helpful.

In particular in combination with Buildroot: kdump/kexec requires two
kernels; how do you generate this with Buildroot: two separate
defconfigs, or with a post-build / post-image script, or something
else?

Would you agree that it could be useful to introduce support for this
in Buildroot, for example through a config option that does the extra
things required, based on certain input provided?

Thanks,
Thomas
