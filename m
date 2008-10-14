From: Jason Curl <jcurlnews@arcor.de>
Date: Tue, 14 Oct 2008 20:44:01 +0200
Subject: [Buildroot] iptables-1.4.1
In-Reply-To: <1223980023.5936.12.camel@box1>
References: <1223980023.5936.12.camel@box1>
Message-ID: <48F4E871.1020203@arcor.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Josef Pospisil wrote:
> Hello,
>
> i am really new to linux and buildroot so sorry if my question is a dumb
> question.
> I built my own buildroot system everything works fine so far. But i want
> to install my own (patched) iptables. So installed iptables
> with ./configure make and make install. But when i try to execute the
> command iptables i get an error that it cant find the file or directory
> even if the iptables binary is there and its within the $PATH. If i do
> strace iptables it says the same that it could not find the file or
> directory. 
>
> Can anyone help me with this problem plz?
>   
If you built it yourself, are you using the right compiler? For example, 
I'd get the same error when running a cross compiled uclibc binary on a 
glibc only system, even though they're both x86. If you use buildroot 
somehow, you might want to provide more info.

> Thanks,
>
> Josef Pospisil
>
>   
