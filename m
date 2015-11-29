From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 29 Nov 2015 14:24:35 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-11-28
In-Reply-To: <20151129151532.4d11d3b2@free-electrons.com>
References: <20151129073018.04C72101FF6@stock.ovh.net>
 <1448791721.2011.9.camel@embedded.rocks>
 <20151129150031.5f26aeba@free-electrons.com>
 <CA+BsyQ7SgoOs4GT0AFrqbdc+DWLG2+CyMA6EN+Oqbob1LR9OoQ@mail.gmail.com>
 <20151129151532.4d11d3b2@free-electrons.com>
Message-ID: <CA+BsyQ5F3z5Ha8j_6Whaj3qvWMDifGiDeOmqiFODqxHyNn9DDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29 November 2015 at 14:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Brendan,
>
> On Sun, 29 Nov 2015 14:06:01 +0000, Brendan Heading wrote:
>> >  1/ We have two patches in package/arptables/ that were meant to fix
>> >     the build of arptables with musl, so we should get rid of them. Or
>> >     instead, you can contact Brendan Heading
>> >     <brendanheading@gmail.com>, who did commit
>> >     61fe902bacaca7c5fdcc7d3a68ded95a835fe2e1, which was supposed to
>> >     make arptables build properly with musl. Brendan ?
>>
>> Hmm, I'm wondering why the problem is showing up again. I will see if
>> I can reproduce it.
>
> It is easily reproducible with:

Thomas,

Yeah I'm seeing it here. First guess is that it looks like a bit of a
pain to fix. I will take another look later on.

Wondering why this worked before .. did we change the version of musl
we are building against since the summer ? (I'm guessing we did).

Brendan
