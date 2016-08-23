From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 23 Aug 2016 22:47:39 +1200
Subject: [Buildroot] [PATCH/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAFOYHZDQpZWxo4rAAuXj6JDhOLcmRPb=19+_JWC_jKS_8vmpRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2016-08-23 9:51 GMT+12:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
>
> +N:     Chris Packham <judge.packham@gmail.com>
> +F:     package/eventlog/
> +F:     package/micropython/

Probably want to add package/micropython/-lib/ and package/syslog-ng/
unless someone else wants them.
