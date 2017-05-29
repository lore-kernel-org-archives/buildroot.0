From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:15:11 +0200
Subject: [Buildroot] [PATCH 1/1] Added notes to the mosh package help to
 clarify run time issues.
In-Reply-To: <CAPJzBTrho+CL8vKFHh0NzoQ49RfJEcfzg4ZUNMGi2+f599UxFg@mail.gmail.com>
References: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
 <20170529223932.2acf7216@free-electrons.com>
 <CAPJzBTrho+CL8vKFHh0NzoQ49RfJEcfzg4ZUNMGi2+f599UxFg@mail.gmail.com>
Message-ID: <20170529231511.07303b15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 22:02:08 +0100, Gon?alo Salazar wrote:

> Thank you for the inputs, I realize that the notes are not really clear.
> I'm trying to convey the idea of runtime dependencies that exist if
> you are trying to include mosh in a host you will be accessing later.

Beware that in the context of Buildroot, "host" is often used to
indicate the machine where the Buildroot build is done, as opposed to
the "target", where the stuff built by Buildroot is executed.

Hence, it should be made extra clear that you mean "host" in the
networking sense, and not the build sense.

> Should I resubmit the patch after clarifying the notes?

Yes, please.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
