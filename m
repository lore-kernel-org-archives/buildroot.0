From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Dec 2020 10:17:56 +0100
Subject: [Buildroot] [PATCHv5 2/5] package/bcc: new package
In-Reply-To: <20201220014439.fetlfhngmdh5zy3o@e107158-lin.cambridge.arm.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
 <20201206173537.1397691-2-romain.naour@gmail.com>
 <20201220014439.fetlfhngmdh5zy3o@e107158-lin.cambridge.arm.com>
Message-ID: <bd8588fc-c0b1-9298-df73-4062024c361c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Qais,

Le 20/12/2020 ? 02:44, Qais Yousef a ?crit?:
> Hi Romain
> 
> On 12/06/20 18:35, Romain Naour wrote:
>> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
>>
>> bcc is a front-end tool for eBPF :
>> https://github.com/iovisor/bcc/blob/master/README.md.
>> eBPF is the most powerful Linux tracer, and bcc
>> allows to write eBPF scripts in C and PYTHON3.
>>
>> bcc can help to troubleshoot issues quickly on
>> embedded systems (as long as Linux kernel
>> version >= 4.1).
>>
>> bcc can also make it easy to create observabilty tools,
>> SDN configuration, ddos mitigation, intrusion detection
>> and secure containers. More information is available at:
>> https://ebpf.io/
>>
>> BCC can be tested on the target :
>> $ mount -t debugfs none /sys/kernel/debug
>> $ cd /usr/share/bcc/tools
>> $ ./execsnoop
>>
>> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Qais Yousef <qais.yousef@arm.com>
>> ---
> 
> This only missed adding my patch to fix up python installation path (attached).

Sorry I missed it.

> 
> With that patch added

Added for the next submission.

> 
> Tested-by: Qais Yousef <qais.yousef@arm.com>
> Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Thanks for your tests and review!

Best regards,
Romain


> 
> Thanks
> 
> --
> Qais Yousef
> 
