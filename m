From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 13:58:03 +0200
Subject: [Buildroot] backtrace() not working on ARMv7a
In-Reply-To: <1406792854426-76360.post@n4.nabble.com>
References: <1406788255956-76350.post@n4.nabble.com>
 <20140731083943.49d4b0db@free-electrons.com>
 <1406792854426-76360.post@n4.nabble.com>
Message-ID: <20140731135803.4186aed9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear prafulla_kota,

On Thu, 31 Jul 2014 00:47:34 -0700 (PDT), prafulla_kota wrote:

> Thanks for quick reply and i have attached the .config file. 
> 
> We have applied below patch in ulibc and it worked fine for below
> requirement and we do have requirement on GLIBC as well and requesting the
> same here. 

I think I would suggest to ask on the glibc mailing list instead. There
has been some discussion about this back in 2011
(http://gcc.1065356.n5.nabble.com/ARM-Linux-EABI-unwinding-through-a-segfault-handler-td692287.html),
not sure what the conclusion was. Buildroot uses recent versions of
glibc, so you can perfectly contact upstream and report this issue.

Let us know what the outcome of the discussion is, or maybe even Cc:
the Buildroot mailing list so that if there's any Buildroot specific
question, we can answer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
