From: Kevin Chadwick <ma1l1ists@yahoo.co.uk>
Date: Fri, 24 Aug 2012 16:06:30 +0100
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <CAAfyv37BVphvKch7Ww0mP2Aid2Wt5GQ+ZGZopwrxy2=BO5o4WQ@mail.gmail.com>
References: <CAAfyv37BVphvKch7Ww0mP2Aid2Wt5GQ+ZGZopwrxy2=BO5o4WQ@mail.gmail.com>
Message-ID: <36228.42615.bm@smtp110.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> scp test.txt root@<IP>:/home/defaut and result is:
> Permission denied, please try again.
> 
> What I'm doing wrong? Is there anything I'm missing?

Are you sure /home/defaut exists.

I know less about dropbear but with openssh you need extra things like
ttys for scp, that you do not need for sftp.

-- 
_______________________________________________________________________

'Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface'

(Doug McIlroy)
_______________________________________________________________________
