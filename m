From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 22:55:59 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150317213403.GC21001@waldemar-brodkorb.de>
References: <20150315221722.3645eb35@free-electrons.com>
 <20150315221813.173a36e2@free-electrons.com>
 <5508382D.7080008@zacarias.com.ar>
 <20150317153028.66788805@free-electrons.com>
 <55084360.1070405@zacarias.com.ar>
 <20150317161320.50559502@free-electrons.com>
 <55086A77.6060907@zacarias.com.ar>
 <20150317213403.GC21001@waldemar-brodkorb.de>
Message-ID: <20150317225559.4e539db9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 17 Mar 2015 22:34:03 +0100, Waldemar Brodkorb wrote:

> My opinion on this is, that there are systems supporting threads
> with uClibc, which do not have TLS support. Linuxthreads.old does
> not make use of TLS. When you build for coldfire or ARM noMMU, tls 
> is not available and it should be disabled while configuring gcc.

Sure, but we don't have to make this an option. The plan is to enable
TLS only when available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
