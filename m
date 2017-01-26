From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 08:48:39 +0100
Subject: [Buildroot] [PATCH 1/1] toybox: new package
In-Reply-To: <CA+TH9VnTJLxN_YeR9-Ht3PY0L2cCiFRWmMXcx+f6v7UX0EmcPg@mail.gmail.com>
 (Angelo Compagnucci's message of "Thu, 26 Jan 2017 08:31:03 +0100")
References: <5422DBCD.10505@landley.net>
 <CA+TH9Vk+5EVM7xFgcjQG8C1qWFmRwb-fNhu=HSzJ2YKwDT9kmw@mail.gmail.com>
 <54DBCBA5.7010307@landley.net>
 <CA+TH9Vmveq-bH2x1PnYg5zC=dDgy079N6sSdqe-+Gn2aUab5eA@mail.gmail.com>
 <87k29kix8z.fsf@dell.be.48ers.dk>
 <8b233955-d30b-1945-1a88-774c6bf865e1@landley.net>
 <87h94me0zr.fsf@dell.be.48ers.dk>
 <CA+TH9VnTJLxN_YeR9-Ht3PY0L2cCiFRWmMXcx+f6v7UX0EmcPg@mail.gmail.com>
Message-ID: <87d1fadzxk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

Hi,

 >> So let me clarify: In the context of Buildroot, what would be the
 >> technical reason to use toybox instead of busybox today? Please keep it
 >> short.

 > For me it's releated to licensing. IMHO it's important to have the
 > freedom to choose between a copyleft/non copyleft license for such a
 > vital component like busybox/toybox in an embedded linux distro.

But busybox is licensed under the same license as the Linux kernel. What
do you use instead of Linux?

-- 
Bye, Peter Korsgaard
