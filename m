From: Qais Yousef <qais.yousef@arm.com>
Date: Mon, 21 Dec 2020 13:41:26 +0000
Subject: [Buildroot] [PATCHv6 2/5] package/bcc: new package
In-Reply-To: <20201220151203.2206747-2-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-2-romain.naour@gmail.com>
Message-ID: <20201221134126.izyj6oiavibysvo4@e107158-lin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/20 16:12, Romain Naour wrote:
> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> 
> bcc is a front-end tool for eBPF :
> https://github.com/iovisor/bcc/blob/master/README.md.
> eBPF is the most powerful Linux tracer, and bcc
> allows to write eBPF scripts in C and PYTHON3.
> 
> bcc can help to troubleshoot issues quickly on
> embedded systems (as long as Linux kernel
> version >= 4.1).
> 
> bcc can also make it easy to create observabilty tools,
> SDN configuration, ddos mitigation, intrusion detection
> and secure containers. More information is available at:
> https://ebpf.io/
> 
> BCC can be tested on the target :
> $ mount -t debugfs none /sys/kernel/debug
> $ cd /usr/share/bcc/tools
> $ ./execsnoop
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Tested-by: Qais Yousef <qais.yousef@arm.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---
> v6
> - Add missing python patch from Qais
> - remove luajit patch since the luajit support is explicitely disabled
> - keep tested-by from Qais since he tested bcc (but not the luajit support)
> - drop the reviewed-by due to luajit and python changes
> - Add Romain in DEVELOPERS file

Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Thanks!

--
Qais Yousef
