From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 03 Aug 2011 09:05:46 +0200
Subject: [Buildroot] broken socat
In-Reply-To: <CANPyyuOwmztPhQMg876Tvzw2nKqSVzJDDpc0TUkCqdRU2U8uXA@mail.gmail.com>
References: <CANPyyuOwmztPhQMg876Tvzw2nKqSVzJDDpc0TUkCqdRU2U8uXA@mail.gmail.com>
Message-ID: <4E38F34A.4020407@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 01.08.2011 23:12, schrieb Mike Williams:
> Has anyone else noticed a broken socat on PPC or other big-endian
> systems? The termios options specified manually in the .mk file appear
> to be wrong, as socat asserts when run because they aren't equal to
> the platform's definition. It appears these options are determined
> during configuration by compiling small programs and testing them, as
> they must be manually set when cross compiling. I know nothing about
> termios, but is it possible that we could just define them based on
> architecture in the .mk file and be done with it?
> 
> Additionally, it appears that 2.0.0-b4 has a problem with a UDP-RECV
> source, that 1.7.1.3 does not. Perhaps it would be wise to revert to
> the stable version until the next release is out of beta, along with
> whatever changes fixing the termios problem requires?

Have you reported these issues to socat maintainer?

Yegor
