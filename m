From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 11 Jun 2014 11:21:38 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <20140611111844.2952ecac@free-electrons.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
 <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
 <20140611111844.2952ecac@free-electrons.com>
Message-ID: <CAHkwnC9RPGoZcp4bqffN5yCnWRJoeRxKFf72JmrwwAFr3jCnyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2014 at 11:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 11 Jun 2014 11:14:38 +0200, Fabio Porcedda wrote:
>
>> > We should go towards *removing* stuff from the main Makefile, not
>> > adding more :-)
>>
>> Using hooks was my initial proposition but Arnout suggested the above
>> solution and you and Perer liked it.
>> Have you changed your mind about using hooks?
>
> Ah. I don't remember. Do you have a pointer to this discussion? I'd
> like to see what were the arguments back then :-)

Sure: http://lists.busybox.net/pipermail/buildroot/2014-April/095052.html

> Thanks, and sorry for the change in position.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


Best regards
-- 
Fabio Porcedda
