From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 17:14:09 +0100
Subject: [Buildroot] Verifying Checksum ... Bad Data CRC
In-Reply-To: <CAKvcKqfVv-dScpXv8ke91FzeQwJ40L4=54u1Bd9zjCpgAcEWkQ@mail.gmail.com>
References: <CAKvcKqe0ikfjVcKcoTASC9LzsEcwfYpFmqMziqF_MjhYWVsipw@mail.gmail.com>
 <20160127163348.19c41a0c@free-electrons.com>
 <CAKvcKqfVv-dScpXv8ke91FzeQwJ40L4=54u1Bd9zjCpgAcEWkQ@mail.gmail.com>
Message-ID: <20160127171409.57a528fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gabriel,

Please don't top post, this is bad practice on mailing lists.

On Wed, 27 Jan 2016 13:01:35 -0300, Gabriel Andr?s Castillo wrote:
> Thanks for the answer. I'm erasing the NAND before reflashing the kernel.
> I'm sure of that becouse, when i go back with non preemptible kernel, all
> is working fine.
> 
> I think that the problem is that the uImage is being stored in other part
> of the memory of the SOM. Could be that on "menuconfig-> Kernel ->
> (0x20008000) load address" is setting wrong? In case of that, what is the
> value that i have to set it?

Please read my original reply entirely. It tells you why your kernel
doesn't boot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
