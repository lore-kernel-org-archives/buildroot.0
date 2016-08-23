From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 13:44:38 +0200
Subject: [Buildroot] [PATCH/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <CAFOYHZDQpZWxo4rAAuXj6JDhOLcmRPb=19+_JWC_jKS_8vmpRQ@mail.gmail.com>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAFOYHZDQpZWxo4rAAuXj6JDhOLcmRPb=19+_JWC_jKS_8vmpRQ@mail.gmail.com>
Message-ID: <20160823134438.550a0616@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 22:47:39 +1200, Chris Packham wrote:
> Hi Thomas,
> 
> 2016-08-23 9:51 GMT+12:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > This is an initial list of Buildroot developers. It has been created
> > semi-automatically by parsing the Git history, and finding the authors
> > of commits with a title like "<foo>: new package". Some additional
> > manual tweaking has been done (merging multiple entries corresponding to
> > the same person, adding some more entries, etc.).
> >
> > +N:     Chris Packham <judge.packham@gmail.com>
> > +F:     package/eventlog/
> > +F:     package/micropython/  
> 
> Probably want to add package/micropython/-lib/ and package/syslog-ng/
> unless someone else wants them.

Since you are the original authors of those packages, I was wondering
why my script that parsed the Git history didn't find those ones. It's
because:

	micropython-lib: new packages

there's a final "s" here which didn't match my script regexp.

And:

	syslog-ng: New package

there's a capital "N" in New which my regexp also wasn't taking into
account.

I've added you as the contact developer for those two packages. Thanks
for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
