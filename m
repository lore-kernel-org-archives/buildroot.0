From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 6 Apr 2021 12:54:45 +0100
Subject: [Buildroot] [PATCHv6 4/5] package/bpftrace: new package
In-Reply-To: <CANLo3JhERRWK_kJCa0phxXVybPJuPM76PEEstN9tRUek04e+gQ@mail.gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-4-romain.naour@gmail.com>
 <20201221134549.nk4eu6qpto36ahpq@e107158-lin>
 <20210123194408.3omcypashiq44le5@e107158-lin>
 <20210225101849.nt6rnloszarwrgm3@e107158-lin>
 <CANLo3JhERRWK_kJCa0phxXVybPJuPM76PEEstN9tRUek04e+gQ@mail.gmail.com>
Message-ID: <20210406115445.iueiqqgxhc7qz3yq@e107158-lin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/21 12:01, Romain Naour wrote:
> Hello Quais, All,
> 
> Le jeu. 25 f?vr. 2021 ? 11:18, Qais Yousef <qais.yousef@arm.com> a ?crit :
> 
>     On 01/23/21 19:44, Qais Yousef wrote:
>     > On 12/21/20 13:45, Qais Yousef wrote:
>     > > On 12/20/20 16:12, Romain Naour wrote:
>     > > > From: Qais Yousef <qais.yousef@arm.com>
>     > > >
>     > > > bpftrace is a high-level tracing language for Linux enhanced Berkeley
>     > > > Packet Filter (eBPF) available in recent Linux kernels (4.x).
>     > > >
>     > > > Only tested on x86_64 and aarch64. The package doesn't support i386
>     and
>     > > > aarch32.
>     > > >
>     > > > The libbpf dependency allow to enable the BTF support:
>     > > >  # bpftrace --info
>     > > >  System
>     > > >    OS: Linux 5.4.58 #1 SMP Sun Dec 20 15:56:56 CET 2020
>     > > >    Arch: aarch64
>     > > >
>     > > >  Build
>     > > >    version: 2020.11-328-g019a9
>     > > >    LLVM: 9.0.1
>     > > >    foreach_sym: yes
>     > > >    unsafe uprobe: no
>     > > >    bfd: yes
>     > > >    bpf_attach_kfunc: yes
>     > > >    bcc_usdt_addsem: yes
>     > > >    bcc bpf_attach_uprobe refcount: yes
>     > > >    libbpf: yes
>     > > >    libbpf btf dump: yes
>     > > >    libbpf btf dump type decl: yes
>     > > >
>     > > > bfptrace doesn't use the libbpf_bcc library provided by bcc package.
>     > > >
>     > > > Signed-off-by: Qais Yousef <qais.yousef@arm.com>
>     > > > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>     > > > Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
>     > > > ---
>     > > > v6: Update DEVELOPERS file
>     > >
>     > > LGTM.
>     >
>     > Ping.
>     >
>     > I had issues with building patch 5, but the rest of the series is in good
>     shape
>     > IMO and can be merged independently at least.
>     >
>     > Is there anything more needs to be done to help get this support merged?
> 
>     Ping again. It'd be great to finally have these merged.
> 
> 
> Maintainers are currently busy at the release 2021.02 version of Buildroot.
> 
> But yes, this work has been reviewed and reworked by Quais and me.
> 
> I guess It's good to go.

Another gentle ping. Hopefully the release is done now for this to be
considered.

Thanks

--
Qais Yousef
