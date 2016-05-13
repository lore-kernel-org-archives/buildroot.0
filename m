From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 15:30:20 +0200
Subject: [Buildroot] [PATCH 3/9] package/go-bootstrap: Set CC to host CC
In-Reply-To: <1463072012.23824.3.camel@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <14cc3c8334b20ed8b9f5510556a4b83dc4f85e55.1463010771.git.geoff@infradead.org>
 <20160512152854.56c727f2@free-electrons.com>
 <1463072012.23824.3.camel@infradead.org>
Message-ID: <20160513153020.04adab18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 09:53:32 -0700, Geoff Levand wrote:

> Yes, it is generally known that the go build system is not compatible
> with the use of ccache.
> 
>   https://github.com/golang/go/issues/11685

OK. Then please improve the commit log to explain this, and add a
comment in the code that it is intentional to not use ccache because it
doesn't play well with Go's build system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
