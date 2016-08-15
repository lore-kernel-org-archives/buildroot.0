From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 15 Aug 2016 09:40:21 -0700
Subject: [Buildroot] [PATCH 1/2] xen: Ensure host Python2 is used
In-Reply-To: <20160814161633.10f3a42d@free-electrons.com>
References: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
 <20160814161633.10f3a42d@free-electrons.com>
Message-ID: <CAKmqyKO_Qy-ZvnPhk6xELmQyPvV1Za2kPYND_cB1HQXwz899kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 14, 2016 at 7:16 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 12 Aug 2016 15:30:05 -0700, Alistair Francis wrote:
>> To avoid Xen build issues ensure that host Python 2 is used.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  package/xen/xen.mk | 3 +++
>>  1 file changed, 3 insertions(+)
>
> Applied to master, thanks.

Great! Thanks.

Any news on the second patch as well?

Thanks,

Alistair

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
