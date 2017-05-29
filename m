From: =?UTF-8?Q?Gon=C3=A7alo_Salazar?= <glbsalazar@gmail.com>
Date: Mon, 29 May 2017 22:30:29 +0100
Subject: [Buildroot] [PATCH 1/1] Added notes to the mosh package help to
 clarify run time issues.
In-Reply-To: <20170529231511.07303b15@free-electrons.com>
References: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
 <20170529223932.2acf7216@free-electrons.com>
 <CAPJzBTrho+CL8vKFHh0NzoQ49RfJEcfzg4ZUNMGi2+f599UxFg@mail.gmail.com>
 <20170529231511.07303b15@free-electrons.com>
Message-ID: <CAPJzBTqAjB8mgm9VuKgAGBRwx3WLrWao_pEPokY3Z6SrYn0bPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just to ensure that the patch is submitted correctly this time, is this clearer?


Mosh requires that the remote machine has a locale setting matching
the one on the client.

 When using mosh with dropbear on a remote machine, the client needs mosh
 with a version above 1.3.0 and the --no-ssh-pty option needs to be passed
 when starting the connection.

Thanks,
Gon?alo Salazar


2017-05-29 22:15 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 29 May 2017 22:02:08 +0100, Gon?alo Salazar wrote:
>
>> Thank you for the inputs, I realize that the notes are not really clear.
>> I'm trying to convey the idea of runtime dependencies that exist if
>> you are trying to include mosh in a host you will be accessing later.
>
> Beware that in the context of Buildroot, "host" is often used to
> indicate the machine where the Buildroot build is done, as opposed to
> the "target", where the stuff built by Buildroot is executed.
>
> Hence, it should be made extra clear that you mean "host" in the
> networking sense, and not the build sense.
>
>> Should I resubmit the patch after clarifying the notes?
>
> Yes, please.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
