From: Qais Yousef <qais.yousef@arm.com>
Date: Mon, 21 Dec 2020 13:43:52 +0000
Subject: [Buildroot] [PATCHv6 3/5] package/libbpf: new package
In-Reply-To: <20201220151203.2206747-3-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-3-romain.naour@gmail.com>
Message-ID: <20201221134352.qv3bunyym5pyvlar@e107158-lin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/20 16:12, Romain Naour wrote:
> A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
> directory plus its supporting header files. The version
> of the package reflects the version of ABI.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---
> I'm not sure if updating the bpf.h provided by the toolchain linux-headers
> is the right things to do.
> 
> v6: Update DEVELOPERS file

LGTM.

Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Thanks

--
Qais Yousef
