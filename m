From: =?UTF-8?Q?Gon=C3=A7alo_Salazar?= <glbsalazar@gmail.com>
Date: Mon, 29 May 2017 22:02:08 +0100
Subject: [Buildroot] [PATCH 1/1] Added notes to the mosh package help to
 clarify run time issues.
In-Reply-To: <20170529223932.2acf7216@free-electrons.com>
References: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
 <20170529223932.2acf7216@free-electrons.com>
Message-ID: <CAPJzBTrho+CL8vKFHh0NzoQ49RfJEcfzg4ZUNMGi2+f599UxFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for the inputs, I realize that the notes are not really clear.
I'm trying to convey the idea of runtime dependencies that exist if
you are trying to include mosh in a host you will be accessing later.

I'll write the notes.

Should I resubmit the patch after clarifying the notes?

Best regards,
Gon?alo

2017-05-29 21:39 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 29 May 2017 19:29:35 +0100, Gon?alo Salazar wrote:
>> Added notes to the mosh package help to clarify some
>> issues related with it to ensure mosh will work properly after adding it.
>> This includes adding a proper LOCALE on the host and an extra flag when using
>> mosh with dropbear.
>
> The commit title should start with the name of the package, i.e:
>
>         mosh: add notes to clarify runtime issues
>
>>         https://mosh.mit.edu
>
> The notes should go before the upstream URL, and the indentation should
> be one tab + two spaces.
>
>> +
>> +          Mosh requires a host LOCALE matching the client provided LOCALE.
>
> I'm sorry, but I don't understand this sentence.
>
>> +          When using mosh with dropbear, a version with the --no-ssh-pty option on
>> +          the client is required.
>
> And also this one.
>
> So for me, those explanations do not clarify anything :-/
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
