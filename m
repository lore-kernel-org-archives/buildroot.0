From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:44:11 +0200
Subject: [Buildroot] [PATCH v3 04/11] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <a2616806-51ae-c3b8-e5d6-1ba0daa2298f@gmail.com>
References: <20200916055934.609436-1-egorenar@linux.ibm.com>
 <20200916055934.609436-5-egorenar@linux.ibm.com>
 <a79e13e6-902e-c351-c292-383660e06451@gmail.com>
 <87wo0t2gob.fsf@oc8242746057.ibm.com>
 <a2616806-51ae-c3b8-e5d6-1ba0daa2298f@gmail.com>
Message-ID: <87tuvw23ok.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain Naour <romain.naour@gmail.com> writes:

>
> Yes, I'm on a f31 x86_64 host.
> I tested several time and it boot time to time.
> I didn't investigated further, but it seems a problem around the RNG driver.
>

Could you please add "initcall_debug debug" to the kernel command line
and send the console output back when it crashed ?

Thanks
Regards
Alex
