From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 20 Dec 2020 01:43:59 +0000
Subject: [Buildroot] [PATCHv5 1/5] package/llvm: add BPF backend
In-Reply-To: <20201206173537.1397691-1-romain.naour@gmail.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
Message-ID: <20201220014359.wniw3cghqjbqlxdk@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/20 18:35, Romain Naour wrote:
> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> 
> bcc is a front-end tool for eBPF :
> https://github.com/iovisor/bcc/blob/master/README.md.
> eBPF is the most powerful Linux tracer, and bcc
> allows to write eBPF scripts in C and PYTHON3.
> 
> BCC requires enabling LLVM backend BPF support.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---

Tested-by: Qais Yousef <qais.yousef@arm.com>
Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Thanks

--
Qais Yousef
