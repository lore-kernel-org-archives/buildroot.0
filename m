From: GA K <guyarkam@gmail.com>
Date: Mon, 8 Mar 2021 17:11:10 -0600 (CST)
Subject: [Buildroot] RISCV32 How to avoid the generation of compressed
 instructions
In-Reply-To: <CAEYXRPniVPF2VZze00+vhCvy-qZTG6QerUm1u0Ez61v+coGKqg@mail.gmail.com>
References: <CAEYXRPniVPF2VZze00+vhCvy-qZTG6QerUm1u0Ez61v+coGKqg@mail.gmail.com>
Message-ID: <1615245070183-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The follow the steps below to fix the issue:
1) make linux-xconfig (make linux-menuconfig would work too)
2) go to Boot Options => remove UEFI (which is selected by default)
3) got to  Platform Type => remove "Emit compressed instructions"
4) make
That should do the job
G



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
