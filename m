From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 21:00:38 +0100
Subject: [Buildroot] [PATCH 0/5] Add Xilinx ZynqMP and ZCU106 board
 support
In-Reply-To: <CAKmqyKMX13u2nazTkd0FpDrzqVez33A=WXoQst0ghusSCx5O+Q@mail.gmail.com>
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
 <87372rir1r.fsf@dell.be.48ers.dk>
 <CAKmqyKPCKhWpm+z4P0-LMtu8c6VXpsq5cUecACYEsC1QbRhKoQ@mail.gmail.com>
 <87r2qbf4em.fsf@dell.be.48ers.dk>
 <CAKmqyKMX13u2nazTkd0FpDrzqVez33A=WXoQst0ghusSCx5O+Q@mail.gmail.com>
Message-ID: <CACXmViYVdrK6is-zUJwK-8jRqkcRqRSp+v6Gi6QADqaYO5CkQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 27, 2018 at 10:31 PM, Alistair Francis <alistair23@gmail.com> wrote:

>> Alistair, do you know if bootgen is downloadable somewhere separately?
>
> AFAIK it's not. I think SPL should be fine. Maybe supporting both
> options is the best. If people want to follow the official path then
> they can install bootgen or prepare it manually.

Either that, or use https://github.com/antmicro/zynq-mkbootimage

-- 
Bye, Peter Korsgaard
