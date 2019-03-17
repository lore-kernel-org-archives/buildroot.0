From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Mar 2019 22:32:25 +0100
Subject: [Buildroot] add two user
In-Reply-To: <CAOqJNTcsbw9bHCgEO7YAZJFBe_=5JDR1j1KVoZUnKCU8V_BBWQ@mail.gmail.com>
References: <CAOqJNTcsbw9bHCgEO7YAZJFBe_=5JDR1j1KVoZUnKCU8V_BBWQ@mail.gmail.com>
Message-ID: <38bf0dc9-f3cc-f769-9f43-be07ba4765df@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/03/2019 14:31, ?????? ????? wrote:
> Hello, people. I want to add two user in my system. One user added successful. I
> added second user to user table. First user created, but second user doesn't
> created.
> 
> my user table
> user 8000 ntc 2000 =useruser /home/user /usr/bin/sh dialout,input user
> dev 8001 dev 2001 =userdev /home/dev /usr/bin/sh sudo dev user
                                                       ^ comma missing?

 There may also be a newline missing at the end of the file.

 Regards,
 Arnout

> 
> Regards,
> Sakhno Serhii
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
