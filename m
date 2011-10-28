From: Damian Kaczmarek <damian@veritymedical.co.uk>
Date: Fri, 28 Oct 2011 13:38:54 +0200
Subject: [Buildroot] fix for mplayer with armv7 / neon
In-Reply-To: <CANVadiF0uxJ-jNBkWKmG=JoOrJa9ATnszxLVovu6Tq4-zbxW3A@mail.gmail.com>
References: <CANVadiHajYSQyOY9VAVX9mL=ZW+3vgsra5SW76LjKZtPJneNcg@mail.gmail.com>
 <CAAXf6LX1JfKGScyO9v269rLEdbk8wf9UTiw_SHdQ=5XqKuJdDA@mail.gmail.com>
 <CANVadiF0uxJ-jNBkWKmG=JoOrJa9ATnszxLVovu6Tq4-zbxW3A@mail.gmail.com>
Message-ID: <201110281338.55446.damian@veritymedical.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bruno Niklaus <niklaus.bruno@gmail.com> Friday 28 of October 2011 13:24:52 
wrote:
> Okay, until it arrives here and i can test if mplayer really works i will
> get into the git / diff things,
> when the board is here test if this change works or not, and then make a
> real patch !
Actually I did check this patch before because I have submitted a similiar 
one. Mplayer worked quite fine with it. Unfortunately it does not work
anymore after my toolchain change, it segfaults and I do not have time
to debug this at this moment. Anyway, I would say the patch is OK.
Regards,
Damian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111028/7f711c36/attachment-0001.asc>
