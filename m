From: Qais Yousef <qais.yousef@arm.com>
Date: Thu, 17 Dec 2020 18:48:37 +0000
Subject: [Buildroot] [PATCH v4 3/4] package/libbpf: new package
In-Reply-To: <d11f8b8a-6878-bd1c-5867-7a44bd5b146b@gmail.com>
References: <20201107002836.3101760-1-romain.naour@gmail.com>
 <20201107002836.3101760-3-romain.naour@gmail.com>
 <20201129152701.ccfvkwjpih3otpxb@e107158-lin.cambridge.arm.com>
 <d11f8b8a-6878-bd1c-5867-7a44bd5b146b@gmail.com>
Message-ID: <20201217184837.ceiq7zhiinlsppnq@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/20 18:09, Romain Naour wrote:
> Hello Qais,
> 
> Le 29/11/2020 ? 16:27, Qais Yousef a ?crit?:
> > Hi Romain
> > 
> > Shiny new package! Should we add a couple of sentences about the package in the
> > commit message rather than leaving it empty?
> 
> I can copy past the Config.in help text:
> 
> 	  libbpf library.
> 	  A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
> 	  directory plus its supporting header files. The version
> 	  of the package reflects the version of ABI.
> 
> I don't have much to say.

Sounds good to me. It's hard to say much I agree.

> Maybe that building libbpf from the kernel source (as linux-tools package) failed.

Would be worth adding I'd say. But it's up to you.

Thanks

--
Qais Yousef
