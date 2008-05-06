From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 6 May 2008 02:16:33 -0300
Subject: [Buildroot] link to busybox
In-Reply-To: <547821.98673.qm@web94103.mail.in2.yahoo.com>
References: <547821.98673.qm@web94103.mail.in2.yahoo.com>
Message-ID: <d6cda7730805052216v18ea7bd1l7681744d84d78b13@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>  I am using buildroot for an arm board.
>
>  Is it common to have all my executables as links to busybox?

Yes, that's how busybox works, it's a single binary file for all the
tools, so it shares code and reduces total size.

>  The issue I am facing is that I am not able to get the shell prompt. It keeps on respawning the getty when I try to login.
>

I don't use arms, but AVR32 instead. I had a similar issue a while
back and it was something to do with bash, once I removed bash from
the build, everything worked ok. You might want to try that.

Kind Regards,
   Thiago A. Correa
