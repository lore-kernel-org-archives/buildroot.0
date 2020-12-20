From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 20 Dec 2020 01:44:39 +0000
Subject: [Buildroot] [PATCHv5 2/5] package/bcc: new package
In-Reply-To: <20201206173537.1397691-2-romain.naour@gmail.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
 <20201206173537.1397691-2-romain.naour@gmail.com>
Message-ID: <20201220014439.fetlfhngmdh5zy3o@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 12/06/20 18:35, Romain Naour wrote:
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
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---

This only missed adding my patch to fix up python installation path (attached).

With that patch added

Tested-by: Qais Yousef <qais.yousef@arm.com>
Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Thanks

--
Qais Yousef
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-python-CMakeLists.txt-Fix-python-installation-path.patch
Type: text/x-diff
Size: 1108 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201220/08b94534/attachment.patch>
