From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 29 Jan 2014 10:09:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-28
In-Reply-To: <87eh3rxk03.fsf@dell.be.48ers.dk>
References: <20140129073009.4D1A1100E8C@stock.ovh.net>
 <87eh3rxk03.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivz36YbBj++Fe8oyQK2qpTsu_q8ZfquAZcuQU8WYG_MKGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 29, 2014 at 9:36 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>  > Build statistics for 2014-01-28
>  > ===============================
>
>  >         success : 77
>  >        failures : 47
>  >        timeouts : 3
>  >           TOTAL : 127
>
>  >       i686 | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/55bda4076af031db9778d97f9ddc5c6b14de17ce/
>  >        arm | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/9ba2f8ecb0a73cc7e625faf713ad4161202b2293/
>  >       i686 | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/4e1988f049fa97574da54e5097e5ef1668c2687c/
>  >        arm | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/02a15ad5211a1e620002c442ce256147d9b9ee88/
>
> Maxime, these are all because rtmpdump isn't compatible with our version
> of polarssl. It looks like it is fixed in upstream rtmpdump git. Could
> you give it a test and send a patch to bump the git revision?
Yes, I saw the results this morning. I will look at it tonight and send a patch.
>
> --
> Bye, Peter Korsgaard
