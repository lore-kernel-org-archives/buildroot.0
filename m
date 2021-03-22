From: Andreas Ziegler <br015@umbiko.net>
Date: Mon, 22 Mar 2021 16:43:35 +0000
Subject: [Buildroot] Xeon variant for x86_64 target
In-Reply-To: <mailman.16066.1616404411.250923.buildroot@busybox.net>
References: <mailman.16066.1616404411.250923.buildroot@busybox.net>
Message-ID: <a6b872eb8a8039297b4a5c8057922c51@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Atilla,

> I am preparing a config for an Intel Xeon D based target. There is no 
> Xeon
> variant available in the 2021.02 release. I am not very familiar with 
> the
> x86 family but I want to create a pro[er variant if possible.

You need to specify the processor architecture inside the Linux kernel 
separately (Processor type -> Processor family).

Since Linux puts Core 2 and (newer) Xeon in one setting, you should be 
fine with Core 2 for Buildroot also.

Regards,
Andreas
