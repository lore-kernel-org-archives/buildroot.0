From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:20:25 +0100
Subject: [Buildroot] [PATCH 3/3] Add perf tools support: this is the
 kernel patch to be applied to the kernel for kernel compile to go through;
 it basically adds a typedef.
In-Reply-To: <CAPDLWs-2Jdyj5F_XaVyGW3kciq2Qmpz0ivbgBAvacXeNZSWy2w@mail.gmail.com>
References: <CAPDLWs99Xx5ncxuCuFErsGzOnbs1br3VDcCFZooozWrHU+B=SQ@mail.gmail.com>
 <50E54257.8050201@googlemail.com>
 <CAPDLWs-2Jdyj5F_XaVyGW3kciq2Qmpz0ivbgBAvacXeNZSWy2w@mail.gmail.com>
Message-ID: <20130103112025.5016894a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kaiwan Billimoria,

On Thu, 3 Jan 2013 15:37:09 +0530, Kaiwan Billimoria wrote:

> Thanks for your inputs.
> I don't have git send-email working, yet...

Another reason to use git send-email is that your patches have been
line-wrapped by your e-mail client, so they are basically impossible to
apply without manual fixes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
