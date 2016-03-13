From: Mau Z <zmau1962@gmail.com>
Date: Sun, 13 Mar 2016 22:48:14 +0200
Subject: [Buildroot] A 64 bit system which enables 32 bit applications
In-Reply-To: <20160313212003.564a68aa@free-electrons.com>
References: <CAPFcPT+TVFb3FD4ubuYH=m5SNOOiObS4p1WENMf+kE8XgvXnWA@mail.gmail.com>
 <20160313212003.564a68aa@free-electrons.com>
Message-ID: <CAPFcPTJPWGUyEass0mCdgP9KpO5c6OX7_1qHTQefcfTz7QbhXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks
Is there anybody out there that had tried to implement something like
this and can advise ?
What If I build both pure systems and simply copy the /lib from the
"pure 32 bits system" to something like /lib32 of the "pure 64 bit
system" ?

Thanks again
zmau


On Sun, Mar 13, 2016 at 10:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 13 Mar 2016 20:12:35 +0200, Mau Z wrote:
>
>> I need to build a 64 bit system, but I need to run a 32 bit
>> application on to of it.
>> I looked into the buildroot menus/options, and I could not find any
>> clear way to do this.
>> Any advice ?
>
> We don't support this today. I.e, we can only build a pure 64 bits
> system, or a pure 32 bits system. But we don't support multiarch, with
> one part of the system using 64 bits libraries, and another part of the
> system using 32 bits libraries.
>
> The main problem is that it wouldn't be easy to define in menuconfig
> which package should be built 32 bits vs. which package should be built
> 64 bits.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
