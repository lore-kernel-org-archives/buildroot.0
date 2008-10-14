From: Josef Pospisil <J.Pospisil@gmx.net>
Date: Tue, 14 Oct 2008 12:27:03 +0200
Subject: [Buildroot] iptables-1.4.1
Message-ID: <1223980023.5936.12.camel@box1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i am really new to linux and buildroot so sorry if my question is a dumb
question.
I built my own buildroot system everything works fine so far. But i want
to install my own (patched) iptables. So installed iptables
with ./configure make and make install. But when i try to execute the
command iptables i get an error that it cant find the file or directory
even if the iptables binary is there and its within the $PATH. If i do
strace iptables it says the same that it could not find the file or
directory. 

Can anyone help me with this problem plz?

Thanks,

Josef Pospisil
