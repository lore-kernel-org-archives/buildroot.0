From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Apr 2014 15:32:16 +0200
Subject: [Buildroot] How to enable inetd in buildroot
In-Reply-To: <CAKGbVbs-d0BsPm1DHieUBNhx49NpR4pQMFt_NbOAyOM8vVDwBw@mail.gmail.com>
References: <CAKGbVbuLPuiEtCSNu9WpWfcnq4axdFFycmyCpXTBAo1jw6pNag@mail.gmail.com>
 <20140403150800.22ef96a7@skate>
 <CAKGbVbs-d0BsPm1DHieUBNhx49NpR4pQMFt_NbOAyOM8vVDwBw@mail.gmail.com>
Message-ID: <CAAXf6LW9k=pCPOOpHYtuSxOE49W5BVyXzVX1RtF=akWiHTZqqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Qiang,

[please don't top-post, put your reply below the message you reply to]

On Thu, Apr 3, 2014 at 3:19 PM, Qiang Yu <yuq825@gmail.com> wrote:
[..]
>> > I'm trying to use some services provided by inetd. But can't find the
>> > configuration
>> > for enabling it and generating startup script and inetd.conf. I notice
>> > someone has
>> > already submit some patch for doing this:
>> > http://lists.busybox.net/pipermail/buildroot/2011-December/048207.html
>> > but not found in the latest buildroot.
>> >
>> > So can somebody tell me what's the state of inetd in buildroot?
>> > Do I have to apply this patch to use inetd, or there is another
>> > "official"
>> > way?

Another version of that patch was sent to the list in June:
http://patchwork.ozlabs.org/patch/164551/

It received some comments from Arnout, asking to simplify the patch.
Unfortunately, there was no response from the submitter anymore.

Later, in one of the patchwork cleanup sessions, we marked this patch
as Rejected because no feedback was given anymore.

You are welcome to implement the suggestions by Arnout, test it, and
send a new patch to the list.

Thanks in advance,
Thomas
