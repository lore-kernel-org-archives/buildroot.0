From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Jan 2017 08:45:00 +0100
Subject: [Buildroot] dhcpcd build fails
In-Reply-To: <CAA2DH4shoEmg0dPgB5+5wFBK5yDcFz8OENJEm37eUaFLSZ+_yw@mail.gmail.com>
 (Prasant J.'s message of "Thu, 5 Jan 2017 11:48:30 +0530")
References: <CAA2DH4t=asj1xnvHChcXQXNU4Q0jkCHuwQ+pYDA-8mtpgKBnnw@mail.gmail.com>
 <87r34j2bo5.fsf@dell.be.48ers.dk>
 <CAA2DH4shoEmg0dPgB5+5wFBK5yDcFz8OENJEm37eUaFLSZ+_yw@mail.gmail.com>
Message-ID: <87k2aat0g3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Prasant" == Prasant J <pj0585@gmail.com> writes:

Hi,

 >> It sounds like your toolchain doesn't have IPv6 support. Please provide
 >> more details. What Buildroot version are you using and what is your
 >> .config?

 > Hi Peter,

 > Thanks for your response.

 > I'm using Buildroot 2015.02 (This is released by Analog Devices)

 > This patch has fixed the issue:
 > https://patchwork.ozlabs.org/patch/465743/

Yes, we have fixed a LOT of issues during the last two years. Please try
to get Analog Devices to update their Buildroot version - Or if they
haven't made a lot of changes, consider moving to mainline 2016.11.1
Buildroot.

If you cannot do that and have other issues, please check the git
history of the failed package to see if the issue has already been fixed
in git before asking on the list.

-- 
Bye, Peter Korsgaard
