From: Toan Pham <tpham3783@gmail.com>
Date: Wed, 7 Feb 2018 17:29:01 -0500
Subject: [Buildroot] Suggestion for Makefile to probably import
 BR2_CONFIG
In-Reply-To: <20180130181213.GB3468@scaer>
References: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
 <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
 <CAGNmLEMn=NFuq+iKj8e2PuF-A4+tGj_VDjq1FBj6+xzDPU=_iQ@mail.gmail.com>
 <d7cd5dae-5ae3-54f3-4376-f17c27e98065@mind.be>
 <CAGNmLEN0N9NziMj6OUDEAkEhu6bDmc43jBnXV6MFSP3EEupnSg@mail.gmail.com>
 <be14460d-9241-e14a-d4f1-8c30a62d7451@mind.be>
 <20180129091113.3acccd2c@windsurf.lan>
 <87wp0183ww.fsf@dell.be.48ers.dk> <20180130181213.GB3468@scaer>
Message-ID: <CAGNmLEPu=rTxVePUznQm5A5BmS_T2U5H8v1LREp9vRny+ZrhaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  >> Yann, Thomas, Peter, what do you think?
>
>
Arnout,

Thank you for the detailed explanation as to why "auto.conf" was needed.
Please apply appropriate patches to remove the split config so that we can
have a more intuitive build system.  In the meantime, I'll stick with using
the supplied patch, which was passing BR2_CONFIG to silentoldconfig target.

TP
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180207/97ef7496/attachment.html>
