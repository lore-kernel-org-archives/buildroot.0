From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Mar 2012 13:52:54 -0700
Subject: [Buildroot] vsftpd
In-Reply-To: <87ehstsims.fsf@macbook.be.48ers.dk>
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
 <4F6211CF.7030701@visionsystems.de>
 <87ehstsims.fsf@macbook.be.48ers.dk>
Message-ID: <CALo-6+h0TX=StG=TWUhg-tAWr-NAmwNR_cUYD2YQyrnd+EqxKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor:

I would also suggest trying the default arm toolchain in busybox and
seeing if it compiles vsftpd. Personally, I am currently using
CodeSourcery's toolchain for a glibc build this week and recommend
them for an external toolchain. I also have not used Linaros toolchain
at all.

Charles

On Thu, Mar 15, 2012 at 1:40 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>
> Hi,
>
> ?Yegor> Do we have inetd/xinetd? Can't find
> ?Yegor> them. http://en.wikipedia.org/wiki/Xinetd seems to be
> ?Yegor> unsupported. What is the modern way of running daemons on
> ?Yegor> demand-?
>
> Busybox has an inetd applet, but we don't have any of the standalone
> versions, if that's what you mean.
>
> ?Yegor> By the way, I have trouble compiling vsftpd at least with the
> ?Yegor> latest linaro toolchain (haven't tried other toolchains so far):
>
> It works here with the default internal arm toolchain, but I haven't
> tried with the linaro one.
>
> --
> Bye, Peter Korsgaard



-- 
Charles Krinke
